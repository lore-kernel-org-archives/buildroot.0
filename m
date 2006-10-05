From: mike <wtf62@rovoreed.com>
Date: Thu, 05 Oct 2006 17:56:33 +0000
Subject: [Buildroot] How do I select the PCMCIA package ?
Message-ID: <1160070993.4021.18.camel@glynys>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simple question. How do I select the PCMCIA package? What do I need to
select first ?

I want to build a system with PCMCIA, but menuconfig doesn't allow it
for selection.
It seems to be dependent on BR2_PACKAGE_LINUX, and the only way I can
see of getting that set is by selecting something in "Board Support
Options" - none of which I really want.
I have built my own "special" version of the linux kernel with the
various drivers and things I want and set $(LINUX_DIR) and
$(LINUX_SOURCE_DIR) to point to the right place. Are there other
undocumented environment variables I need to set up ?

Mike
