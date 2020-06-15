From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 15 Jun 2020 11:57:35 +0530
Subject: [Buildroot] [PATCH 3/4] configs/nanopi_m4: new defconfig
In-Reply-To: <1592073154-13731-4-git-send-email-sunil@amarulasolutions.com>
References: <1592073154-13731-1-git-send-email-sunil@amarulasolutions.com>
 <1592073154-13731-4-git-send-email-sunil@amarulasolutions.com>
Message-ID: <CAMty3ZCwNc8h74GvJt6jtrPMXba+7f1TtLW+2XWTv_V5EUME_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 14, 2020 at 12:02 AM <sunil@amarulasolutions.com> wrote:
>
> From: Suniel Mahesh <sunil@amarulasolutions.com>
>
> A defconfig for the friendlyarm nanopi-m4 was added in
> 493c3979a4def978a1137cf8543bf0de50d2615e, but then removed
> in a24bd8936f57a590f810e14d7828cf1bddce580e because an ARM32
> compiler was needed to build ATF, and this was not supported
> back then.
>
> Now, since package/arm-gnu-a-toolchain/ has been added, this
> defconfig can be re-introduced.
>
> Following new changes are introduced in comparision with the
> older changeset:
>         - readme updated
>         - GPT partition layout
>         - update defconfig to build ATF
>         - bump u-boot to 2020.04
>         - bump linux to 5.4.46
>
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
