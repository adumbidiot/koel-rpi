FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get install git curl php5 php5-curl

RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

RUN git clone https://github.com/phanan/koel

RUN cd koel && touch .env
RUN cd koel && sed -i 's/ADMIN_EMAIL=/ADMIN_EMAIL=nathaniel.daniel23@outlook.com/g' .env
RUN cd koel && sed -i 's/ADMIN_NAME=/ADMIN_NAME=admin/g' .env
RUN cd koel && sed -i 's/ADMIN_PASSWORD=/ADMIN_PASSWORD=password/g' .env
RUN cd koel && sed -i 's/DB_CONNECTION=/DB_CONNECTION=mysql/g' .env
RUN cd koel && sed -i 's/DB_HOST=/DB_HOST=192.168.1.11/g' .env
RUN cd koel && sed -i 's/DB_DATABASE=homestead/DB_DATABASE=koel/g' .env
RUN cd koel && sed -i 's/DB_USERNAME=homestead/DB_USERNAME=root/g' .env
RUN cd koel && sed -i 's/DB_PASSWORD=secret/DB_PASSWORD=pass/g' .env

RUN cd koel && ls .env

RUN cd koel && composer install
RUN cd koel && php artisan koel:init
