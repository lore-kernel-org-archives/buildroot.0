From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:58:58 +0200
Subject: [Buildroot] [PATCH 1/2] lftp: remove unrequired config options
In-Reply-To: <1470676311-12729-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470676311-12729-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160810145858.47228602@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Aug 2016 22:41:50 +0530, Rahul Bedarkar wrote:
> When installation prefix is specified in "--with-readline" config
> option, lftp's build systems figures out include dir and linker flags.
> So don't specify --with-readline-{inc,libs} options which are anyways
> get ignored by build system.
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/lftp/lftp.mk | 2 --
>  1 file changed, 2 deletions(-)

Both patches applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
