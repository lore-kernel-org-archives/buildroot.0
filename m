From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 22:47:08 +0100
Subject: [Buildroot] Buildroot error
In-Reply-To: <8dee00da-0ff9-66de-2baf-c0b1f39dc96e@mind.be>
References: <D3FA0BA2E2AD54469423D3A670F43027238ED2AB@mail.protoprod.local>
 <8dee00da-0ff9-66de-2baf-c0b1f39dc96e@mind.be>
Message-ID: <20161115224708.043f0c31@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Nov 2016 22:39:32 +0100, Arnout Vandecappelle wrote:

> > >>>> linux-headers custom Syncing from source dir /home/mikeb/sandbox/buildroot-2016.08/uClinux-dist  
> > rsync -au --chmod=u=rwX,go=rX --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS /home/mikeb/sandbox/buildroot-2016.08/uClinux-dist/ /home/mikeb/sandbox/buildroot-2016.08/output/build/linux-headers-custom  
> 
>  Either the linux tree in uClinux-dist is so old that it doesn't have the
> "headers_install" target yet (I think that's from 2.6.10-ish), or the tree
> you're pointing to is not actually a linux tree. In the first case, you also
> misconfigured your kernel headers, because you claim it's 4.7. But you probably
> just took the first thing you saw :-)

uClinux-dist is the name of the "distribution" around uClinux, and
uClinux-dist is pretty much a build system, like Buildroot. So it seems
like Michael has used the source code of a build system, and offered it
to Buildroot as the source of the Linux kernel. Obviously, this isn't
going to work very well.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
