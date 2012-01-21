From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jan 2012 02:50:36 +0100
Subject: [Buildroot] [PATCH 6/7] libedje: Add new package.
In-Reply-To: <CAFbHwiSuSw5zXZJM+ZUM5c2yPmSx1bLsR2rFwUhw+V1oA4=BOg@mail.gmail.com>
References: <CAFbHwiSuSw5zXZJM+ZUM5c2yPmSx1bLsR2rFwUhw+V1oA4=BOg@mail.gmail.com>
Message-ID: <201201210250.37041.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 18 January 2012 12:17:37 Will Newton wrote:
> Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


[snip]
> +if BR2_PACKAGE_LIBEDJE
> +
> +config BR2_PACKAGE_LIBEDJE_CC
> +	bool "build edje_cc"
 Missing help text.

 And since there's only one config, use 'depends on BR2_PACKAGE_LIBEDJE'
rather than an if construct.

> +
> +endif # BR2_PACKAGE_LIBEDJE
[snip]


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
