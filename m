From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 13 Aug 2018 06:46:53 -0700
Subject: [Buildroot] [PATCH 05/18] perl-data-uuid: new package
In-Reply-To: <20180812232713.74e6ba82@windsurf>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-6-chrismcc@gmail.com>
 <20180812232713.74e6ba82@windsurf>
Message-ID: <CALURroRxMkO+-NiyQV-ArGnS0RcjrNYLrPZp6m-G85DGrTp39g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello

On Sun, Aug 12, 2018 at 2:27 PM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> <snip>
>



> The license is not BSD. It's apparently some variant of the MIT license
> that is documented as the "HP variant" in
> https://fedoraproject.org/wiki/Licensing:MIT#HP_Variant. So I've used
> the MIT-HP tag, even if it isn't documented officially by SPDX.
>
> It seems like the license details on CPAN are sometimes wrong. Please
> double check them manually whenever you submit a new Perl package in
> Buildroot.
>
>
Yea, I found this:
https://github.com/rjbs/Data-UUID/issues/26

Makefile.PL declares BSD license, but LICENSE file contains MIT license
text as confirmed by Fedora legal team
https://lists.fedoraproject.org/pipermail/legal/2013-August/002226.html.
Could you please clarify this discrepancy? It would be great if you aligned
the Makefile.PL and LICENSE content.



> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>



-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180813/ce9e9566/attachment.html>
