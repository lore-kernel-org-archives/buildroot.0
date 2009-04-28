From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Apr 2009 20:32:25 +0200
Subject: [Buildroot] gdb snapshot
In-Reply-To: <20090428184043.3e10c50a@surf> (Thomas Petazzoni's message of
	"Tue\, 28 Apr 2009 18\:40\:43 +0200")
References: <1240935848.19264.2.camel@sven> <20090428184043.3e10c50a@surf>
Message-ID: <87d4awfx3a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> as I am having problems with gdb 6.8 on our ARM platform, I thought
 >> I'd give the gdb snapshot a try and selected it in the buildroot
 >> menu. But this fails as the patches in toolchain/gdb/snapshot seem to
 >> be targetted at a particular snapshot (gdb-6.3.50.20050915). Does
 >> this work for anyone else? Can this possibly work?

What problems are you having with 6.8 exactly?

 Thomas> Maybe instead of using the the gdb.tar.bz2 symbolic link, we could
 Thomas> refer to a precise version of the gdb snapshot, so that the patches
 Thomas> have a chance to work.

 Thomas> The patches in snapshot/ haven't been updated since 2006, so I would
 Thomas> say that this part is unmaintained, which means that nobody uses it and
 Thomas> we can probably drop it.

Yeah, agreed.

-- 
Bye, Peter Korsgaard
