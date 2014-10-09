From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 9 Oct 2014 09:08:17 +0100
Subject: [Buildroot] [PATCH v3] package/trinity: New package
In-Reply-To: <CAHXCMM+an7ijdVvZGnxTndxauwdhivNjjmC6-7mdD4TYFPL0xQ@mail.gmail.com>
References: <1412781125-11737-1-git-send-email-Vincent.Riera@imgtec.com>
 <CAHXCMM+an7ijdVvZGnxTndxauwdhivNjjmC6-7mdD4TYFPL0xQ@mail.gmail.com>
Message-ID: <54364271.50001@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On 10/08/2014 08:39 PM, Samuel Martin wrote:
> It looks like you can now bump the version to [1] and get rid of this
> uclibc stuff ;-)
>
> [1] https://github.com/kernelslacker/trinity/commit/1cc389fb22ca4a7447011a7a14bb526d44197255
>
> Regards,

the upstream maintainer and me are working together to fix the problems 
with uClibc. That was the first problem and is now fixed. However, there 
are more problems after that one, so this package is not yet ready to be 
built for uClibc.

Regards,

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
