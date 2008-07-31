From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 31 Jul 2008 09:13:38 +0200
Subject: [Buildroot] buildroot failing when jffs2 output selected
In-Reply-To: <1217457837.6526.6.camel@kokopelli>
References: <1217457837.6526.6.camel@kokopelli>
Message-ID: <48916622.4070103@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brian Beattie wrote:
> I'm trying the build a jffs2 filesystem but buildroot fails when trying
> the build the host utilities with a missing include file "acl.h" (see
> error log) after faking that file and two others the link fails due to
> missing -llzo2.
> 
> Any hints?

In gentoo accent this would help ;)
# emerge dev-libs/lzo sys-apps/acl

HTH,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
