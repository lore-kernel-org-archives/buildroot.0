From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Feb 2014 21:40:21 +0100
Subject: [Buildroot] [PATCH v2 0/6] Add toolchain knob for NPTL
In-Reply-To: <5304EDC0.4010001@mind.be>
References: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5304EDC0.4010001@mind.be>
Message-ID: <20140219214021.0f12db48@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 19 Feb 2014 18:45:36 +0100, Arnout Vandecappelle wrote:

> > We have a growing number of packages that need pthread functions only
> > available when the NPTL implementation is used. But at the same time,
> > we have several architectures (AVR32, ARC, Blackfin and Xtensa) that
> > don't support NPTL.
> > 
> > This set of commits adds a new hidden toolchain config knob named
> > BR2_TOOLCHAIN_HAS_THREADS_NPTL, and uses it in four packages: three
> > were already having special conditions to more-or-less detect the
> > availability of NPTL, and one package (qt5) which fixes an autobuilder
> > failure.
> 
>  You're missing a patch to docs/manual/adding-packages-directory.txt to
> standardize the comment.

Did you miss PATCH 2/6 ?

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
