From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 5 Nov 2016 10:50:19 -0200
Subject: [Buildroot] [PATCH 0/2] core: revert to using fakeroot instead
	of pseudo
In-Reply-To: <20161105123115.GD31560@free.fr>
References: <cover.1478342758.git.yann.morin.1998@free.fr>
 <20161105123115.GD31560@free.fr>
Message-ID: <CAOMZO5D_o4xivmHu_jwO==tr0-pcia=Z+Yx4wKLOV7u-ZUqFEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sat, Nov 5, 2016 at 10:31 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> After discussing the matter on IRC, we've decided to go another route,
> to instead fix makedevs to make it check the file and accept if its
> already the expected type, and only bail out if not.

Ok, great. I will be glad to test the new approach.

Thanks
