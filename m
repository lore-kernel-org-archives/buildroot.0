From: Kyle Hayes <kyle@greenmonitor.com>
Date: Mon, 17 Jan 2011 13:01:09 -0800
Subject: [Buildroot] bug when doing clean kernel build?
Message-ID: <AANLkTikJiXF-w3baF2POeVr5Zh_sGUkdS+UQCQFmzb4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure if this is a code bug or a user bug :-)

I'm trying to repeat my problems with openssh segfaulting and to do
that I'm trying to build with make xconfig; make clean; make.
However, when I do this, I see that the Linux kernel, 2.6.37, is made
with Pentium Pro selected and I explicitly selected i486 in the
Buildroot config.  I can go in after the make finishes and reconfigure
the kernel again to get the right processor type.  Is this expected
behavior?

Best,
Kyle
