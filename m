From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Mon, 10 May 2021 11:51:45 +0200
Subject: [Buildroot] [PATCH] package/dt-utils: add patch to fix
 barebox-state lock file
In-Reply-To: <20210217185609.1120677-1-b.bilas@grinn-global.com>
References: <20210217185609.1120677-1-b.bilas@grinn-global.com>
Message-ID: <87lf8m6hn2.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Bartosz Bilas <b.bilas@grinn-global.com> writes:

> Add patch from the upstream mailing list [1] that fixes
> the following error when we try to execute barebox-state 
> command:
>
> # barebox-state
> Failed to open lock-file /var/lock/barebox-state
>
> [1] 
> https://www.mail-archive.com/oss-tools at pengutronix.de/msg00063.html
>

Mentioned patch is now part of 2021.03.0 release. I've sent patch 
updating dt-utils to this version in 
https://patchwork.ozlabs.org/project/buildroot/patch/20210510092853.1481441-1-m.niestroj at grinn-global.com/.

--
Regards,
Marcin
