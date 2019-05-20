From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 20 May 2019 23:07:23 +0200
Subject: [Buildroot] [PATCH] toolchain: specify GCC_BUG_85180 is true
 only if GCC version < 8.x
In-Reply-To: <20190520203949.120720-1-giulio.benetti@micronovasrl.com>
References: <20190520203949.120720-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190520210722.GA24931@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> has been fixed on Gcc version >= 8.x

> So:
> - add 'depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8' to 'config
>   BR2_TOOLCHAIN_HAS_GCC_BUG_85180'.

> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
