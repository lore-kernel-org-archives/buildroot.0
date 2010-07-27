From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 10:37:10 +0200
Subject: [Buildroot] [PATCH 1/1] Improvements to the package conversion
 status script
In-Reply-To: <87eieqdl4c.fsf@macbook.be.48ers.dk>
References: <cover.1280150104.git.thomas.petazzoni@free-electrons.com>
	<cover.1280150104.git.thomas.petazzoni@free-electrons.com>
	<7a132d5ce72cc2c04146ead8dfcd3b3ec8d9ab3a.1280150104.git.thomas.petazzoni@free-electrons.com>
	<87eieqdl4c.fsf@macbook.be.48ers.dk>
Message-ID: <20100727103710.10b0e451@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 26 Jul 2010 22:49:23 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> That's a pretty non-specific commit message, but ok - Committed,
> thanks.

Right. You should have rejected the patch, my commit message was
indeed crappy.

For the record, the improvements are :

 * Slightly improved heuristics so that packages converted to
   GENTARGETS but calling a configure script aren't considered as part
   of the packages that need conversion to AUTOTARGETS. It was
   generating false positives.

 * Slightly improved layout with nice green color for the correct
   packages and red color for the packages that require some sort of
   conversion effort.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
