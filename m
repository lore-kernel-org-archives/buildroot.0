From: Stanislav Vlasic <svlasic@gmail.com>
Date: Sat, 2 Nov 2013 16:31:41 +0100
Subject: [Buildroot] [PATCH 0 of 2] Introduction of Amlogic platform to
	buildroot
Message-ID: <CADYw_J+dw+E6xCosXu=hOo172ZPu1QJgtVTrHmJEQ2eVa6BWWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm not sure if I'm posting this correctly, but will try.

Introduction of Amlogic platform consists of 2 patches:

1. I re-added Linaro 2013.04 toolchain because gcc 4.7 is a must for
Amlogic kernels at the moment
2. I added optional Target platform options submenu under Target options
and added configs for currently only Amlogic MX SoC. Older socs are using
pretty old buildroot, first I have to rewrite their stuff for new buildroot.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131102/ab06a357/attachment.html>
