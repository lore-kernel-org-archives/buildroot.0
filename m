From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sun, 15 Apr 2012 15:56:55 +0200
Subject: [Buildroot] [PATCH] Add sam-ba to at91sam926*_defconfig
In-Reply-To: <87hawlbbdc.fsf@macbook.be.48ers.dk>
References: <1334149610-989-1-git-send-email-alexandre.belloni@piout.net>
 <20120411153529.73613e03@skate>
 <20120411135031.GS29577@game.jcrosoft.org>
 <87hawlbbdc.fsf@macbook.be.48ers.dk>
Message-ID: <20120415135655.GN30672@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11:19 Sun 15 Apr     , Peter Korsgaard wrote:
> >>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:
> 
> Hi,
> 
>  Jean-Christophe> this soc config I disagree
> 
>  Jean-Christophe> I run on ARM and PPC and samba is x86 only
> 
> You build buildroot ON ARM/PPC? That's very uncommon (well, gcc110 is
> ppc64 - But still). Nevertheless, nothing breaks by including sam-ba in
> the build, your host dir just gets a little bit bigger. In this case I
> would say the advantage for the common case (build on x86 for at91
> development) outweighs the minor disadvantage for your use case.
I've a quad Arm and a quad G4

except you expect a packet you install to work I expect to detect the HOST
type and propose it only if it work

Best Regards,
J.
