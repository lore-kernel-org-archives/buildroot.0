From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Feb 2017 23:19:35 +0100
Subject: [Buildroot] [PATCH 0/7] gcc5 fixes for defconfigs
In-Reply-To: <87a896hw93.fsf@dell.be.48ers.dk>
References: <20170228174001.23830-1-arnout@mind.be>
 <20170228212355.36a91c98@free-electrons.com>
 <87a896hw93.fsf@dell.be.48ers.dk>
Message-ID: <94cc14ef-61f6-8151-a570-5d0f0f4aed57@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-02-17 21:54, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
>  > However, it has already been noticed a while ago that these defconfigs
>  > were broken, I did a build test of all defconfigs some time ago, and
>  > reported the issue to the developers who contributed the defconfig
>  > originally. Peter also helped in this effort. See e-mails like:
> 
>  >    [Buildroot] Altera socdk defconfig no longer builds
>  >    [Buildroot] Altera sockit defconfig no longer builds
>  >    [Buildroot] via_imx6_vab820_defconfig fails to build
>  >    etc.
> 
>  > For all the boards you are fixing now, Peter or me contacted the
>  > original submitters. If they haven't been fixed by now, then I would
>  > instead suggest to simply drop support for those boards.
> 
> I agree. Especially as we don't have access to (most) of the boards, and
> older bootloaders/kernels sometimes do break at runtime with newer gcc
> versions.
> 
> E.G. if the defconfigs aren't really supported and looked after, then we
> should pretend they are.
  ^^^^^^ shouldn't :-)

 I'll send removal patches tomorrow (hopefully).

 I've marked the series as rejected in patchwork.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
