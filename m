From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Sep 2014 08:34:43 +0200
Subject: [Buildroot] [PATCH 1/1] omniorb: limit to glibc toolchains
In-Reply-To: <CANQCQpYNfJ0Kk8iNdF_Uncsuse-UBtu_TZtkoNVR7y8J8m-j1Q@mail.gmail.com>
References: <1410790650-61308-1-git-send-email-Matthew.Weber@rockwellcollins.com>
 <20140915200619.198ff41f@free-electrons.com>
 <CANQCQpanft746pTHcvDeNSkdXXkpbjS7x5YrAzMyqwN5E8ukJw@mail.gmail.com>
 <CANQCQpYNfJ0Kk8iNdF_Uncsuse-UBtu_TZtkoNVR7y8J8m-j1Q@mail.gmail.com>
Message-ID: <20140916083443.4264046e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Mon, 15 Sep 2014 20:07:47 -0500, Matthew Weber wrote:

> > Thank you for that clarification, that makes a bit more sense on why this
> > issue didn't come up as often in the autobuilds.  I would assume that
> > updating this path to a needs MMU instead is the correct approach.
> 
> I retested with a "depends on BR2_USE_MMU", which excluded that package
> from the bfin build.

Did you test whether the package builds with Blackfin FDPIC ?

Looking at the build error, it doesn't seem to be MMU or noMMU related.

> I had another question.  Over the last couple weeks, I've created a couple
> patches that can be discarded.  How do those get removed from patchworks?

Either the patch submitter does it (everyone can create an account on
patchwork and then manage his own patches), or some patchwork
administrator does it (I think Peter, Yann, Thomas DS, me, and maybe a
few other core developers are patchwork admins).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
