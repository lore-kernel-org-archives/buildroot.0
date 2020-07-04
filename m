From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Sun, 5 Jul 2020 01:11:02 +0530
Subject: [Buildroot] [PATCH 1/4] configs/rockpro64: new defconfig
In-Reply-To: <CAMty3ZB-7hyy4T2KZcixhMR34V4GHn+95q7dA8zxnNrLM_dHgA@mail.gmail.com>
References: <1592073154-13731-1-git-send-email-sunil@amarulasolutions.com>
 <1592073154-13731-2-git-send-email-sunil@amarulasolutions.com>
 <CAMty3ZB-7hyy4T2KZcixhMR34V4GHn+95q7dA8zxnNrLM_dHgA@mail.gmail.com>
Message-ID: <CAM+7aWs2qcivQ1TNhVRUaEhwvGK9qwQ50mWpVRzLap2fery1oQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 15, 2020 at 12:00 PM Jagan Teki <jagan@amarulasolutions.com>
wrote:

> On Sun, Jun 14, 2020 at 12:02 AM <sunil@amarulasolutions.com> wrote:
> >
> > From: Suniel Mahesh <sunil@amarulasolutions.com>
> >
> > A defconfig for the rockpro64 was added in
> > 59e1077b4ebe79622a454b0a8a840e4349a0440d, but then removed
> > in 10f49213b7e2837ae6ed63fc16fbdaa954ecd87f because an ARM32
> > compiler was needed to build ATF, and this was not supported
> > back then.
> >
> > Now, since package/arm-gnu-a-toolchain/ has been added, this
> > defconfig can be re-introduced.
> >
> > Following new changes are introduced in comparision with the
> > older changeset:
> >
> >     - renamed defconfig from pine64_rockpro64 to rockpro64
> >     - updated readme
> >     - using a GPT partition layout
> >     - update defconfig to build ATF
> >     - bump u-boot to 2020.04
> >     - bump linux to 5.4.35
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200705/04c1ebbd/attachment.html>
