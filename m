From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 03 Jun 2010 12:15:36 -0300
Subject: [Buildroot] [PATCH] Remove modutils package
Message-ID: <4C07C718.10405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let's remove the modutils package, it's old, for 2.4 kernels only and
busybox acts as a replacement when/if needed.
It's been deprecated for some time now.

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-nuke-modutils.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100603/6a14fac8/attachment-0001.ksh>
