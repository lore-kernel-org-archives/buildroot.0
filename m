From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jan 2018 15:16:46 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: Fix toolchain to create
 proper builds for MIPS XBurst targets
In-Reply-To: <CAMbDF3KKpBcAw-03Ek3MgsLSKwP9hbuuz5KkVPBF6BSZfG-pfA@mail.gmail.com>
References: <1515170305-25742-1-git-send-email-johannes.schmitz1@gmail.com>
 <20180105212715.5e50d391@windsurf>
 <CAMbDF3KKpBcAw-03Ek3MgsLSKwP9hbuuz5KkVPBF6BSZfG-pfA@mail.gmail.com>
Message-ID: <20180106151646.673c523c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johannes,

On Fri, 5 Jan 2018 22:34:14 +0100, Johannes Schmitz wrote:

> It was not my own patch but I want to help bringing it up again because the
> original author complained that so far it hasn't been accepted. He
> recommended me to try it and see if it helps and it did help.
> 
> Also, the commit log should explain since which gcc version is
> -mfused-madd deprecated, and since which gcc version is -ffp-contract
> available.
> 
> I don't know this, my knowledge is incomplete in this area. I just manually
> applied the original patch. What can we do together to get this patch to an
> acceptable state?

Could you please send a complete patch that includes both Waldemar
changes and yours ? Also, please read the comments in
https://patchwork.ozlabs.org/patch/800406/, they pointed out the fact
that -ffp-contract only exists since gcc 4.6, so its use should be made
conditional. Read the comments from Arnout, who suggests how to address
that.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
