From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Feb 2015 07:21:03 +0100
Subject: [Buildroot] [git commit] lame: unconditionally disable debug
 handling
In-Reply-To: <20150206214705.7E8C47F921@busybox.osuosl.org>
References: <20150206214705.7E8C47F921@busybox.osuosl.org>
Message-ID: <20150207072103.07347436@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 6 Feb 2015 22:46:21 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=f745590297f8a221db3cda0d2eeeabef2657f460
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> As it is also broken on arc, bfin and microblaze and brings very limited
> added value.
> 
> Fixes:
> http://autobuild.buildroot.net/results/643/643d174836457237615b6504e28d7b3c12a37f93/
> http://autobuild.buildroot.net/results/831/831f3a03321cea1b753f3e7dd8d3c6354d51d3e7/
> http://autobuild.buildroot.net/results/71d/71dc37f9cc56f3f53676f54bf28f2ca101bc4505/
> http://autobuild.buildroot.net/results/61f/61f1e956bb433aa80f859b3cf37d374feee1cb0c/
> 
> And many more.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

To be honest, I continue to wonder if BR2_ENABLE_DEBUG should really
pass --enable-debug to all packages, instead of just passing -g to
enable debugging symbols.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
