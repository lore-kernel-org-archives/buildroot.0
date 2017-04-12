From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:03:44 +0200
Subject: [Buildroot] [PATCH 1/2] minnowboard_max-graphical: increase
 ext4 filesystem size
In-Reply-To: <20170412125626.8108-1-arnout@mind.be>
References: <20170412125626.8108-1-arnout@mind.be>
Message-ID: <20170412210344.28b1f840@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Apr 2017 14:56:25 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Now we have changed the default ext2/3/4 filesystem size from automatic
> to 60MB, the minnowboard_max graphical demo config doesn't fit anymore.
> So increase it to double.
> 
> The exact number doesn't matter much, it has to be somewhat smaller
> than 128MiB, so let's take a round number of 120000K.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  configs/minnowboard_max-graphical_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Both applied, thanks!

Ezequiel, it would be nice if you could retest the defconfig on HW,
since you submitted this defconfig originally.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
