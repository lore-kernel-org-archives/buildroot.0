From: Riko Ho <antonius.riko@gmail.com>
Date: Fri, 19 May 2017 14:34:43 +0800
Subject: [Buildroot] Xorg and buildroot ?
In-Reply-To: <20170519063157.2654320766@mail.free-electrons.com>
References: <20170519063157.2654320766@mail.free-electrons.com>
Message-ID: <a5661180-e821-196a-ce4e-76fbb4cab7ea@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried to run xorg in qemu and got, it's X86_64 architecture and I can 
not see complete xorg.conf.

===

# startx
expr: warning: '^/dev/tty[0-9]\+$': using '^' as the first character
of a basic regular expression is not portable; it is ignored
xauth:  file /root/.serverauth.1032 does not exist
xauth:  file /root/.Xauthority does not exist


X.Org X Server 1.14.7
Release Date: 2014-06-05
X Protocol Version 11, Revision 0
Build Operating System: Linux 4.4.0-75-generic x86_64
Current Operating System: Linux RikoRoot 4.11.0 #1 SMP Fri May 19 
11:38:11 AWST 2017 x86_64
Kernel command line: console=ttyS0
Build Date: 19 May 2017  10:53:50AM

Current version of pixman: 0.34.0
     Before reporting problems, check http://wiki.x.org
     to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
     (++) from command line, (!!) notice, (II) informational,
     (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Fri May 19 06:32:26 2017
(==) Using config file: "/etc/X11/xorg.conf"
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
Initializing built-in extension Generic Event Extension
Initializing built-in extension SHAPE
Initializing built-in extension MIT-SHM
Initializing built-in extension XInputExtension
Initializing built-in extension XTEST
Initializing built-in extension BIG-REQUESTS
Initializing built-in extension SYNC
Initializing built-in extension XKEYBOARD
Initializing built-in extension XC-MISC
Initializing built-in extension XINERAMA
Initializing built-in extension XFIXES
Initializing built-in extension RENDER
Initializing built-in extension RANDR
Initializing built-in extension DAMAGE
Initializing built-in extension DOUBLE-BUFFER
Initializing built-in extension RECORD
Initializing built-in extension DPMS
Initializing built-in extension X-Resource
Initializing built-in extension XVideo
Initializing built-in extension XVideo-MotionCompensation
Initializing built-in extension XFree86-VidModeExtension
Initializing built-in extension XFree86-DGA
(EE)
Fatal server error:
(EE) no screens found(EE)
(EE)
Please consult the The X.Org Foundation support
      at http://wiki.x.org
  for help.
(EE) Please also check the log file at "/var/log/Xorg.0.log" for 
additional information.
(EE)
(EE) Server terminated with error (1). Closing log file.

====

Any ideas ?


-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
??,
Regards,
Riko Ho
/*******/

*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170519/0d1aaa76/attachment.html>
