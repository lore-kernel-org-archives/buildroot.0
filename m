From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 01 Sep 2010 09:29:17 -0300
Subject: [Buildroot] [PATCH] Migrate pppd to gentargets and fix radius
	support
Message-ID: <4C7E471D.3020201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Convert pppd to gentargets infrastructure since it's not really autotargets.
Also fix the radius plugin support by making it an option and make it
install dictionaries when enabled.

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-pppd-radius.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100901/a41a2389/attachment.ksh>
