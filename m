From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Nov 2013 10:21:52 +0100
Subject: [Buildroot] [PATCH] libcap-ng: disable on avr32 which lacks TLS
In-Reply-To: <CAHXCMM+F+H6xTA7iH27Lf6Rkq-69nb4DrtNzU7X4bu-RrE_9Jg@mail.gmail.com>
References: <1385107694-2132-1-git-send-email-s.martin49@gmail.com>
 <20131122100515.3743af6c@skate>
 <CAHXCMM+F+H6xTA7iH27Lf6Rkq-69nb4DrtNzU7X4bu-RrE_9Jg@mail.gmail.com>
Message-ID: <20131122102152.595f67d1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 22 Nov 2013 10:17:20 +0100, Samuel Martin wrote:

> If I resubmit the patch, would it be merged or do we prefer just
> having the solution in which
> TLS knob is driven by thread support (as discussed in the thread you
> mentioned above)?
> 
> IMHO, this patch (with the comment fixed) can be integrated for the
> release, and a more long
> term solution can be implement later for the next release.

I believe for 2013.11, a patch like the one you proposed is the best
solution we have (with the ofono comment fixed, of course), but I'd like
to have an entry added in the TODO-list at http://elinux.org/Buildroot
to remind us to do something, with pointers to the relevant discussion.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
