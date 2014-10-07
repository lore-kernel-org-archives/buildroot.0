From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 7 Oct 2014 21:34:42 +0200
Subject: [Buildroot] [PATCH] ser2net: Fix compilation failures due to
 missing TIOCSRS485 macro
In-Reply-To: <20141007192825.7978163b@free-electrons.com>
References: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
 <CAGm1_ktbFdMqF5SOrB1KAP=kdZN8=_Gg6zirOONFw7jPqL4kwg@mail.gmail.com>
 <20141007192825.7978163b@free-electrons.com>
Message-ID: <CAGm1_ku37XtqFR17XBcMLHHSn4pkW66K6Zt6S2r9zA=HmMpLzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 7, 2014 at 7:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Tue, 7 Oct 2014 16:33:09 +0200, Yegor Yefremov wrote:
>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> If you actually agree with the patch, or tested it, or have reviewed
> it, you should give a Tested-by, Acked-by or Reviewed-by, not a
> Signed-off-by. Please see
> http://buildroot.org/downloads/manual/manual.html#_reviewing_and_testing_patches.

Then I'll choose

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

I was actually the author of the upstream ser2net patch, that's why I
thought SoB would be OK :-)

Yegor
