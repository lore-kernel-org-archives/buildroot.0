From: D M <d_mo1234@yahoo.com>
Date: Wed, 23 May 2012 12:30:18 -0700 (PDT)
Subject: [Buildroot] Buildroot and linux-pam?
Message-ID: <1337801418.36273.YahooMailNeo@web160905.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With regards to Dmitry's linux-pam paste-bin: we added linux-pam to our project, where
we use a CodeSourcery toolchain. ?We did not have to manually massage the config output
to get things to work, nor did we have to feed in the -lintl or -lfl. ?However, we did have
to add LINUX_PAM_AUTORECONF set to YES.  Otherwise, the compile eventually fails. ?
I was wondering if the LINUX_PAM_DISABLE_INNETGR?fixup could be avoided by doing?the reconfigure ...

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120523/d5c7d3d5/attachment.html>
