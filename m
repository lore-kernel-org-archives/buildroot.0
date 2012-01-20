From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Jan 2012 21:54:40 +0100
Subject: [Buildroot] [PATCH v4] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <87k44mixzc.fsf@macbook.be.48ers.dk>
References: <CA+gTGJGnxMiY9NKWhFsvsKhZT95N2QV_V2-XzDMN7aJMZRo3uA@mail.gmail.com>
 <201201191327.37010.arnout@mind.be> <87k44mixzc.fsf@macbook.be.48ers.dk>
Message-ID: <201201202154.40800.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 20 January 2012 09:23:19 Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  Arnout> On Thursday 19 January 2012 13:22:08 Arnout Vandecappelle (Essensium/Mind) wrote:
>  >> +   bash_cv_printf_a_format=yes
> 
>  Arnout>  Actually this one depends on UCLIBC_HAS_HEXADECIMAL_FLOATS, so
>  Arnout> maybe that should be kept as a configure option?
> 
> No, a lot of packages break if you start tweaking the uClibc
> configuration. I don't want to add configuration option of all of these,
> and really consider the custom uClibc config stuff to be an advanced
> "you-have-to-know-what-you-are-doing" option.

 I agree; however:

toolchain/toolchain-crosstool-ng/uClibc.config:# UCLIBC_HAS_HEXADECIMAL_FLOATS is not set

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
