yum group install -y "Development Tools"
yum install -y curl file openssl-devel
mkdir ${PREFIX}
mkdir ${PREFIX}/src
mkdir ${PREFIX}/src/squid
curl -o ${PREFIX}/src/squid.tar.gz http://www.squid-cache.org/Versions/v4/squid-4.7.tar.gz
tar -C ${PREFIX}/src/squid --strip-components=1 -xf ${PREFIX}/src/squid.tar.gz
cd ${PREFIX}/src/squid
./configure --prefix=${PREFIX} --with-openssl --enable-ssl-crtd
make -j 4
make install
chown nobody:nobody ${PREFIX}/var/logs
chown nobody:nobody ${PREFIX}/var/cache
yum group remove -y "Development Tools"
yum autoremove
rm -rf ${PREFIX}/src
cp -R ${PREFIX}/etc ${PREFIX}/etc.vanilla;
