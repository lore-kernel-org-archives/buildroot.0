From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Thu, 19 Nov 2009 18:41:10 +0530
Subject: [Buildroot] cannot find /usr/lib/uclibc_nonshared.a
Message-ID: <630286c70911190511vdb28c17oaaacd60700300061@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On git.

make gives:-

make[4]: Entering directory
`/home/nataraj/buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2/src/plugins/sqldrivers/mysql'
rm -f libqsqlmysql.so
linking ../../../../plugins/sqldrivers/libqsqlmysql.so
/home/nataraj/buildroot/output/build/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibcgnueabi/4.3.4/../../../../arm-linux-uclibcgnueabi/bin/ld:
cannot find /usr/lib/uclibc_nonshared.a
collect2: ld returned 1 exit status
make[4]: *** [../../../../plugins/sqldrivers/libqsqlmysql.so] Error 1
make[4]: Leaving directory
`/home/nataraj/buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2/src/plugins/sqldrivers/mysql'
make[3]: *** [sub-mysql-make_default] Error 2
make[3]: Leaving directory
`/home/nataraj/buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2/src/plugins/sqldrivers'
make[2]: *** [sub-sqldrivers-make_default] Error 2
make[2]: Leaving directory
`/home/nataraj/buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2/src/plugins'
make[1]: *** [sub-plugins-make_default-ordered] Error 2
make[1]: Leaving directory
`/home/nataraj/buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2'
make: *** [/home/nataraj/buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2/.compiled]
Error 2


But I do have  ./output/build/staging_dir/usr/lib/uclibc_nonshared.a
and  ./output/toolchain/uClibc-0.9.30.1/lib/uclibc_nonshared.a

what cud be wrong?

regards

Nataraj
