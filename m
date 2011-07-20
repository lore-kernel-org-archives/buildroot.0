From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 21:19:21 +0200
Subject: [Buildroot] [PATCH 10/12] Makefile.package.in: Pass
 non-prefixed name as argument to GENTARGETS_INNER.
In-Reply-To: <1311177810.2189.65.camel@dublxciaranr1.verifone.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <1a95e4dffd7b68d2e9fbcb9d13516f086decab1c.1311141088.git.thomas.petazzoni@free-electrons.com>
 <1311177810.2189.65.camel@dublxciaranr1.verifone.com>
Message-ID: <20110720211921.176c3537@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 20 Jul 2011 17:03:22 +0100,
Quotient Remainder <quotientvremainder@gmail.com> a ?crit :

> You're brave!  I had thought of putting it in the same place but didn't
> think the patch would be accepted so kept it simple.

Well adding the new parameter in the sixth position wasn't very
logical. The second position was more logical. It's a pity that make
doesn't support named parameters.

> These lines seem unnecessary now.  Can't most of the respective
> positional variables now be derived inside the ..._INNER function?

Yes maybe, but I'd prefer to wait for this round of changes to be
merged, before stacking another changes on top of it. I have no idea
how much time it will take to get the proposed changes merged.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
