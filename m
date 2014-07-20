From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 20 Jul 2014 04:20:18 +0400
Subject: [Buildroot] glib 2.40 on xtensa
In-Reply-To: <20140719113327.5393bf25@free-electrons.com>
References: <20140719004023.4a71d4b8@free-electrons.com>
 <CAMo8BfKDFvct4=wDsFVObRMab9P-73LcMvJU2JaNozR=swbT2A@mail.gmail.com>
 <20140719113327.5393bf25@free-electrons.com>
Message-ID: <CAMo8BfKa_uew_4dxvyEFv1d_JDfWFk_eSOfPbG9DL8d0EbvBPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 19, 2014 at 1:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Argh. There's no NPTL support for:
>
>  - ARC (but I believe it's coming)
>  - AVR32 (but we're deprecating this architecture, so we don't care)
>  - Blackfin (and I don't think there's much hope to have NPTL one day,
>    but glib is anyway disabled on !MMU platforms, so we don't care)
>  - Xtensa (don't know)

We're planning to complete NPTL implementation this year.

-- 
Thanks.
-- Max
