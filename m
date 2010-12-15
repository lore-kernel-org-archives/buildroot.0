From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 15 Dec 2010 06:14:43 -0500
Subject: [Buildroot] [PATCH 03/14] toolchain: add support for external
	toolchain profiles and download
In-Reply-To: <20101215113152.2cf64845@surf>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
	<201012141548.38928.vapier@gentoo.org>
	<20101215113152.2cf64845@surf>
Message-ID: <201012150614.44014.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, December 15, 2010 05:31:52 Thomas Petazzoni wrote:
> Regarding this toolchain profile thing, I intended to extend it to
> support the Blackfin toolchains, but I'd like to make sure you're not
> already working on this, in order to avoid duplication.

it seems the profiles thing only supports downloading toolchain binaries ?  in 
the Blackfin setup, the toolchain is usually installed via the host package 
manager (we offer rpms/debs/etc...), so that still wouldnt work for us ...
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101215/98cba22a/attachment-0001.pgp>
