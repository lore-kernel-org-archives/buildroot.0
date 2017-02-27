From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 09:21:43 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-25
In-Reply-To: <20170227022344.GA6762@tungsten.ozlabs.ibm.com>
References: <20170226072845.0954E20755@mail.free-electrons.com>
 <20170226223353.39284983@free-electrons.com>
 <20170227022344.GA6762@tungsten.ozlabs.ibm.com>
Message-ID: <20170227092143.67dc37b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Feb 2017 13:23:44 +1100, Sam Bobroff wrote:

> > unresolvable R_PPC64_ADDR64 against `rand@@GLIBC_2.17'
> > 
> > Sam, could you have a look ?  
> 
> Yes. No idea yet what this problem is but trying to reproduce it now.

Apparently, the patch https://patchwork.ozlabs.org/patch/727430/ is
meant to solve this issue.

> > Would be fixed by https://patchwork.ozlabs.org/patch/724932/, but a
> > better patch was suggested, but never submitted.  
> 
> It looks like there is an active upstream and all we need to do is jump
> through enough hoops, so I'll try pushing Samuel Martin's patch or one
> like it when I have a bit of time.

I've proposed an alternative solution here:

  https://patchwork.ozlabs.org/patch/732614/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
