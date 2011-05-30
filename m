From: Bob Liu <lliubbo@gmail.com>
Date: Mon, 30 May 2011 15:47:19 +0800
Subject: [Buildroot] Build qt failed after update to 2011.05
Message-ID: <BANLkTikfUw4jOL6zYGxdqbFyWT+pjV7X3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, folks

After I updated to 2011.05 release, I failed to build qt.

The error message is like this:
-----------------------------------------------
The tslib functionality test failed!
 You might need to modify the include and library search paths by editing
 QMAKE_INCDIR and QMAKE_LIBDIR in
 /home/bob/buildroot-update/output/build/qt-4.7.3/mkspecs/qws/linux-arm-g++.
make: *** [/home/bob/buildroot-update/output/build/qt-4.7.3/.stamp_configured]
Error 1
-----------------------------------------------

Any ideas is welcome, Thanks!

-- 
Regards,
--Bob
