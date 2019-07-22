From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 22 Jul 2019 08:29:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix build without NLS
In-Reply-To: <20190719211152.3812-1-fontaine.fabrice@gmail.com>
References: <20190719211152.3812-1-fontaine.fabrice@gmail.com>
Message-ID: <20190722062923.GA5516@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

> Set USE_GETTEXT depending on BR2_SYSTEM_ENABLE_NLS as otherwise build
> will fail if gettext is not installed on host because USE_GETTEXT is
> enabled by default since version 20190324 and
> https://github.com/iputils/iputils/commit/2615a527209bb408b54028ef6405075cadd4541b

> Fixes:
>  - http://autobuild.buildroot.org/results/127823ddbd75336abc0fe0e9bd11e4f5249df87c

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for fixing it!
Hope that's the last one needed due changing build system to meson :).

Kind regards,
Petr
