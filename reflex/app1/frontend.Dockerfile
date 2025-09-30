FROM python:3.12 AS builder

WORKDIR /app

COPY . .
RUN pip install -r requirements.txt
# To debug the content of folders during build process (uncomment if needed)
#RUN files="$(ls -a /app)" && echo $files
#RUN files2="$(ls -a /app/.web)" && echo $files2
RUN reflex export --frontend-only --no-zip


FROM nginx

# To debug the content of folders during build process (uncomment if needed)
#RUN files3="$(ls -a)" && echo $files3
#RUN files4="$(ls -a /app)" && echo $files4

# Copy the static files from the builder stage to the nginx html directory
#COPY --from=builder /app/.web/_static /usr/share/nginx/html # Old way...does not work with newer versions of reflex.
COPY --from=builder /app/.web/build/client/ /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
