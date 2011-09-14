From: stl <st.lambert02@gmail.com>
Date: Wed, 14 Sep 2011 10:16:19 +0200
Subject: [Buildroot] Questions related to "Incorrect selection of the C
	library" error
Message-ID: <CAOPDcRz+PpksWoMJBh5mzk8+E7YcdKj=httB1nxajGanmKTNow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am trying to port Buildroot for a new architecture and I am facing
the following error when I build it:

Checking external toolchain settings
Incorrect selection of the C library

The following lib (ld*-uClibc.so.*) is missing in my /lib/ dir.
Where does this lib come from?

In my .config, I have selected BR2_TOOLCHAIN_EXTERNAL=y
and I have set the path for my toolchain, and the prefix.

But where can I set the path for my installed uClibc directory?
( /usr/<arch>-linux-uclibc )

Thanks in advance for your help.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110914/89471556/attachment.html>
