From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 06 Sep 2010 17:06:56 -0300
Subject: [Buildroot] [PATCH] Convert pppd to gentargets,
 fix broken compilation with newer headers, fix radius support
Message-ID: <4C8549E0.5010600@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Obsoletes all my previous pppd patches.
* Convert pppd to gentargets
* Properly support radius plugin by installing dictionaries
* Fix broken compilation with 2.6.35 kernel headers (L2TP plugin breaks)

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-pppd-gentargets-radius-l2tp_for_2.6.35.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100906/2262cb11/attachment.ksh>
