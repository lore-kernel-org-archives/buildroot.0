From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 23 Jul 2008 01:38:00 +0200
Subject: [Buildroot] vim patches .patch
In-Reply-To: <bbbeeccd0807211446q5f7800ddlf2463305b7635056@mail.gmail.com>
References: <bbbeeccd0807211446q5f7800ddlf2463305b7635056@mail.gmail.com>
Message-ID: <200807230138.00459.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wade Berrier, 21.07.2008:
> 
> Attached is a patch to add some more patches to vim.  More
> importantly, it downloads them via http instead of ftp.  Downloading
> via ftp takes forever.

This seems to happen every once in a while.

> I only went up to 274 (instead of 330) because patches started failing
> to apply after that.

Patch 275 is an "extra" patch. Extra patches are for Windows, Mac, Amiga and
other things I think and are left out in the buildroot patches list. The extra
package is extracted though, but that wouldn't be necessary.

I'll send two patches...

Markus
