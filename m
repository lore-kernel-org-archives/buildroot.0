From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Apr 2016 04:31:43 +0200
Subject: [Buildroot] migrating manual makefile to autotools-based
 packages
In-Reply-To: <loom.20160406T191601-706@post.gmane.org>
References: <loom.20160406T145801-819@post.gmane.org>
 <loom.20160406T191601-706@post.gmane.org>
Message-ID: <20160408043143.3da6fc7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Apr 2016 17:18:05 +0000 (UTC), aurelien coulaud wrote:

> hello I found the solution into this slides (page 272):
> http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf
> 
> "Note: as of Buildroot 2015.05,
> TARGETS
> has been renamed to
> PACKAGES"
> 
> So now my old Package with manual makefile compiles.

Using hand-written Makefiles is bad, as you lose many features of the
package infrastructure: legal-info, source, source-check, etc. Please
don't use hand-written Makefiles, use one of the available package
infrastructures. Doing the conversion is generally very easy. If you
don't know how to do it, please post your current .mk file and we'll
give you some hints.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
