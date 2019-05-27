From: Guo Ren <guoren@kernel.org>
Date: Mon, 27 May 2019 19:35:55 +0800
Subject: [Buildroot] [PATCH V2 1/9] arch/csky: Add VDSP and FLOAT_ABI
 compiler options.
In-Reply-To: <20190526224034.60d5671e@windsurf>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
 <20190526224034.60d5671e@windsurf>
Message-ID: <CAJF2gTRLGUrDnTG+7H+EBWhPMpp3-8eX5B-Q4ByisZAH_a2umw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 27, 2019 at 4:40 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed,  8 May 2019 16:58:27 +0800
> guoren at kernel.org wrote:
>
> > +config BR2_CSKY_VDSP
> > +     bool "Enable VDSP 3.0 enhanced instructions Co-processor"
> > +     depends on BR2_ck860
>
> Another comment: you add an option that depends on BR2_ck860 in this
> PATCH 1, but BR2_ck860 is only added in PATCH 2. This is not correct.
Yes, BR2_ck860 should be first in patch.

Best Regards
 Guo Ren
