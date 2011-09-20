From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Tue, 20 Sep 2011 13:18:30 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package: add openocd support
In-Reply-To: <87y5xmun3h.fsf@macbook.be.48ers.dk>
References: <1312911561-23942-2-git-send-email-plagnioj@jcrosoft.com>
 <1316289171-21296-1-git-send-email-plagnioj@jcrosoft.com>
 <8739fuw60t.fsf@macbook.be.48ers.dk>
 <20110918102209.GE16141@game.jcrosoft.org>
 <87y5xmun3h.fsf@macbook.be.48ers.dk>
Message-ID: <20110920111830.GB24966@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13:05 Sun 18 Sep     , Peter Korsgaard wrote:
> >>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:
> 
>  >> This is with a trivial defconfig:
>  >> 
>  >> BR2_arm=y
>  >> BR2_arm926t=y
>  >> BR2_PACKAGE_OPENOCD=y
>  >> 
>  >> E.G. to reproduce stick those 3 lines in .config and run
> 
>  Jean-Christophe> which version of gcc do you use?
> 
> Like the config says, the default version (4.3.6).
I've found the issue on the codesourcery toolchains and pc too no need to
specify we use gnu99 standard

but with buildroot gcc we need so I update it

Best Regards,
J.
