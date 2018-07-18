From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 15:03:50 +0200
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <20180718123443.7242-1-casantos@datacom.com.br>
References: <20180718123443.7242-1-casantos@datacom.com.br>
Message-ID: <20180718150350.4a910b0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jul 2018 09:34:43 -0300, Carlos Santos wrote:
> Prevent creating a dangling symlink when vim is not present on the host
> machine. With BR2_ROOTFS_MERGED_USR, just link to "vim", since they are
> on the same directory, otherwise link to "../usr/bin/vim".
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Baruch had already sent a patch with the same title/intention, but it
is no longer in the pending state in patchwork.

Could you clarify what happened, and which of the two patches is
relevant ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
