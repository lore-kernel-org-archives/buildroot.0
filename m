From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 6 Dec 2017 21:58:01 +0530
Subject: [Buildroot] [PATCH 3/8] arm-trusted-firmware: allow to generate
 the BL31 image
In-Reply-To: <20171203214811.3124-4-thomas.petazzoni@free-electrons.com>
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-4-thomas.petazzoni@free-electrons.com>
Message-ID: <CAMty3ZA=fkx8rKANQ4uG2g7gOoaFM_nKOY6YbZdHktW69GYQsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 4, 2017 at 3:18 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Some platforms (e.g Allwinner ARM64) don't build a FIP image out of
> ATF, but only a BL31 image, which is then encapsulated in U-Boot. This
> commit adds an ATF option to build such an image.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: Jagan Teki <jagan@amarulasolutions.com>

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
