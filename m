From: alexperl <alexondi@rambler.ru>
Date: Tue, 5 Jan 2010 06:45:55 -0800 (PST)
Subject: [Buildroot]  Error build X11(libxcb-atom)
Message-ID: <27026628.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello!
I try build X11 with x86_64 target but I have such error
...
/home/install/Buildroot/1/buildroot/output/staging/usr/bin/../lib/gcc/x86_64-linux-uclibc/4.3.4/../../../../x86_64-linux-uclibc/bin/ld:
warning: libxcb-atom.so.0, needed by ../icccm/.libs/libxcb-icccm.so, not
found (try using -rpath or -rpath-link)
../icccm/.libs/libxcb-icccm.so: undefined reference to `intern_atom_fast'
../icccm/.libs/libxcb-icccm.so: undefined reference to `WM_NAME'
../icccm/.libs/libxcb-icccm.so: undefined reference to `WM_NORMAL_HINTS'
../icccm/.libs/libxcb-icccm.so: undefined reference to `WM_CLIENT_MACHINE'
../icccm/.libs/libxcb-icccm.so: undefined reference to `WM_HINTS'
../icccm/.libs/libxcb-icccm.so: undefined reference to `WM_ICON_NAME'
../icccm/.libs/libxcb-icccm.so: undefined reference to `WM_SIZE_HINTS'
../icccm/.libs/libxcb-icccm.so: undefined reference to
`intern_atom_fast_reply'
../icccm/.libs/libxcb-icccm.so: undefined reference to `ATOM'
collect2: ld returned 1 exit status
...
can anybody help me with it?
-- 
View this message in context: http://old.nabble.com/Error-build-X11%28libxcb-atom%29-tp27026628p27026628.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
