From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Jul 2017 09:42:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-16
In-Reply-To: <CAGm1_kvReAMP7HzJi4xuwc8tW+Pcp3-55qKgLoAUWwEaeA9o=g@mail.gmail.com>
References: <20170717063110.2F68221D9F@mail.free-electrons.com>
 <CAGm1_kvReAMP7HzJi4xuwc8tW+Pcp3-55qKgLoAUWwEaeA9o=g@mail.gmail.com>
Message-ID: <20170717094208.2997abd4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jul 2017 09:36:08 +0200, Yegor Yefremov wrote:

> > Build failures related to your packages:
> >
> >     mips64el |                    attr-2.4.47 | http://autobuild.buildroot.net/results/550541fc47430dfb221734d23b1d520e2886a685
> >         i586 |       python-coherence-0.6.6.2 | http://autobuild.buildroot.net/results/cd99ac66af7a0cb24510bee78dd45884a8695776
> >          arm |       python-coherence-0.6.6.2 | http://autobuild.buildroot.net/results/675721f773795987a2468daa33f299f7dc6ddb8a
> >          arm |       python-coherence-0.6.6.2 | http://autobuild.buildroot.net/results/b36441066d57e52a29ad262d0c8771556b641ca0
> >          arm |       python-coherence-0.6.6.2 | http://autobuild.buildroot.net/results/61b8b7a05f671280bd6ff81782f697d7b5194b03
> >     mips64el |       python-coherence-0.6.6.2 | http://autobuild.buildroot.net/results/c8b8983cc3d66adf866031dc9c68a3a13bf93c92
> >     mips64el |       python-coherence-0.6.6.2 | http://autobuild.buildroot.net/results/acc4fc9a05b3a07e8cdb167cea0df4687e6a4c0f  
> 
> Patch submitted.

Ah, thanks!

> >       x86_64 |      python-cryptography-1.7.2 | http://autobuild.buildroot.net/results/c63e27d93254c8a490e31a21a5550e17719e1876
> >          arm |      python-cryptography-1.7.2 | http://autobuild.buildroot.net/results/ad8092e11cd1432e254eaa430e1daba936488ff3
> >       x86_64 |      python-cryptography-1.7.2 | http://autobuild.buildroot.net/results/027ff1b36e6cba39cd1a94d104ec52816a865c7a
> >       xtensa |      python-cryptography-1.7.2 | http://autobuild.buildroot.net/results/a0197494707751052e01c0d897491edd95d12be8
> >       x86_64 |      python-cryptography-1.7.2 | http://autobuild.buildroot.net/results/867ed2c42882ba265743aaf20fc2bfd9c9cdf2a7
> >       mipsel |      python-cryptography-1.7.2 | http://autobuild.buildroot.net/results/a3729d672813afb952164d4ad4f056369b600839  
> 
> Have to look at this issue.

Don't bother: all of those have been submitted by Matt Weber
autobuilder, which had an issue: it was still building Buildroot commit
from July 10, i.e before I pushed the python2 fix.

Since Matt autobuilder still wasn't fixed, I temporarily disabled his
account yesterday, so such bogus build failures should no longer appear.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
