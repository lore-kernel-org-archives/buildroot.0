From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 22:17:52 +0200
Subject: [Buildroot] [PATCH 1/7] support/testing: test_syslinux: fix
 flake8 errors
In-Reply-To: <20200405230414.416403-1-romain.naour@gmail.com>
References: <20200405230414.416403-1-romain.naour@gmail.com>
Message-ID: <20200406221752.0e466958@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Apr 2020 01:04:08 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Reported by gitlab:
> https://gitlab.com/kubu93/buildroot/-/jobs/499374911
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/testing/tests/boot/test_syslinux.py | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

I've applied the entire series, with some changes on PATCH 6/7, to
which I'll reply specifically.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
