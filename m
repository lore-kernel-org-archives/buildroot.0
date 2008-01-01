From: Claus Klein <claus.klein@arcormail.de>
Date: Tue, 01 Jan 2008 14:47:13 +0100
Subject: [Buildroot] [patch] to use DISABLE_IPV6 instead of fix seting
Message-ID: <477A4461.70205@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

while working on a new rootfile system with ipv6 support, I had problems 
with some packages.
By the way there was an  too error in the libxml2 makefile when 
installing the target-header.

Is it documented how makefiles should be written to be flexible for 
differrent toolchain options like:

libintl,
largefile,
ipv6,
...

Here is my patch

ck

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: ipv6-config.diff
Url: http://busybox.net/lists/buildroot/attachments/20080101/70f51127/attachment.diff 
