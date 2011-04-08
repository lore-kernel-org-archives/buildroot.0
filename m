From: Patryk Benderz <Patryk.Benderz@esp.pl>
Date: Fri, 08 Apr 2011 09:06:46 +0200
Subject: [Buildroot] [Xorg-Server] [GL] No package 'gl' found
Message-ID: <1302246406.4891.131.camel@esp-patben-lin.espdx1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi List,
During configuration of xorg-server I got:

>>> xserver_xorg-server 1.7.5 Configuring
[...]
checking for GL... configure: error: Package requirements (glproto >= 1.4.9 gl >= 7.1.0) were not met:
No package 'gl' found
Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.
Alternatively, you may set the environment variables GL_CFLAGS
and GL_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

I have checked, and glproto is selected in BR as version 1.4.10. Any
hints which BR config option is responsible for GL?

-- 
Patryk "LeadMan" Benderz
Linux Registered User #377521
()  ascii ribbon campaign - against html e-mail 
/\  www.asciiribbon.org   - against proprietary attachments
