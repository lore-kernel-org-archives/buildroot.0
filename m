From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Sun, 5 Jul 2020 01:13:49 +0530
Subject: [Buildroot] [PATCH 4/4] configs/nanopc_t4: new defconfig
In-Reply-To: <CAMty3ZCBMbkrx8f0cpaSUTyKp2YBBgC_B4qx1RrLwzZDijND0A@mail.gmail.com>
References: <1592073154-13731-1-git-send-email-sunil@amarulasolutions.com>
 <1592073154-13731-5-git-send-email-sunil@amarulasolutions.com>
 <CAMty3ZCBMbkrx8f0cpaSUTyKp2YBBgC_B4qx1RrLwzZDijND0A@mail.gmail.com>
Message-ID: <CAM+7aWuWOrcukzVsXO0C+HXw75zfC22AAYROZCP-JqaOPtS+VA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 15, 2020 at 11:58 AM Jagan Teki <jagan@amarulasolutions.com>
wrote:

> On Sun, Jun 14, 2020 at 12:03 AM <sunil@amarulasolutions.com> wrote:
> >
> > From: Suniel Mahesh <sunil@amarulasolutions.com>
> >
> > A defconfig for the friendlyarm nanopc-t4 was added in
> > c23895f06e0988319a1959764a402b57bc21ffaf, but then removed
> > in 8efd4463f78fd68c85b45cc0da347dfb805abb7e because an ARM32
> > compiler was needed to build ATF, and this was not supported
> > back then.
> >
> > Now, since package/arm-gnu-a-toolchain/ has been added, this
> > defconfig can be re-introduced.
> >
> > Following new changes are introduced in comparision with the
> > older changeset:
> >
> >         - updated readme
> >         - GPT partition layout is being used
> >         - update defconfig to build ATF
> >         - bump u-boot to 2020.04
> >         - bump linux to 5.4.46
> >
> > Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> > ---
>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
>

Hi Thomas and all,

May I know the reason why this patch is not getting picked up. Please let
me know,
If something is not making sense. I can rework on them.

Regards
Suniel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200705/a0808eb2/attachment.html>
