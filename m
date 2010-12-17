From: Joe <lordvictory1@yahoo.com>
Date: Fri, 17 Dec 2010 12:52:19 -0800 (PST)
Subject: [Buildroot] Build failure on msgfmt
Message-ID: <393933.14584.qm@web121804.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


After fixing the other issues I got responses from in my prior post I am getting 
the following failure (copied from console screen output) before the build 
stops:


/usr/bin/msgfmt -o test.mo ./de.po; \
        /bin/mkdir -p de/LC_MESSAGES; \
        cp -f test.mo de/LC_MESSAGES
./de.po:15: keyword "msgctxt" unknown
./de.po:15:8: parse error
/usr/bin/msgfmt: found 2 fatal errors
cp: cannot stat `test.mo': No such file or directory
make[5]: *** [test.mo] Error 1
make[5]: Leaving directory 
`/usr/src/embedded/buildroot-2010.11/output/build/host-libglib2-2.26.0/gio/tests'

make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory 
`/usr/src/embedded/buildroot-2010.11/output/build/host-libglib2-2.26.0/gio'
make[3]: *** [all] Error 2
make[3]: Leaving directory 
`/usr/src/embedded/buildroot-2010.11/output/build/host-libglib2-2.26.0/gio'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory 
`/usr/src/embedded/buildroot-2010.11/output/build/host-libglib2-2.26.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/usr/src/embedded/buildroot-2010.11/output/build/host-libglib2-2.26.0'
make: *** [/usr/src/buildroot/output/build/host-libglib2-2.26.0/.stamp_built] 
Error 2


      
