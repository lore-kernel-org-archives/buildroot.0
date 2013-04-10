From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Apr 2013 19:24:24 +0200
Subject: [Buildroot] [PATCH 0/4] External toolchain updates
In-Reply-To: <877gkazpax.fsf@dell.be.48ers.dk>
References: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <877gkazpax.fsf@dell.be.48ers.dk>
Message-ID: <20130410192424.42ce585c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 10 Apr 2013 11:51:34 +0200, Peter Korsgaard wrote:

>  Thomas> Thomas Petazzoni (4):
>  Thomas>   toolchain-external: update ARM Linaro toolchains
>  Thomas>   toolchain-external: update AArch64 Linaro toolchains
>  Thomas>   toolchain-external: fix typo in Blackfin toolchain config option
> 
> Committed these 3, thanks!
> 
>  Thomas>   toolchain-external: remove older Microblaze toolchain
> 
> I'm holding on to this for a little while longer until we figure out how
> to solve the issues.

I'm not sure what to do with the last patch: the older toolchain is
simply no longer available from git.xilinx.com, and github.com doesn't
allow to download such a big binary blob directly. The only solution
that I can see to keep the old toolchain is to keep the tarballs in
http://sources.buildroot.net (just like we happen to do for the new
Microblaze toolchain). Would you be ok with that?

That said, the old toolchain is not really great to promote to users
either, because it uses a _very_ old glibc that causes a number of
compilation issues with our packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
