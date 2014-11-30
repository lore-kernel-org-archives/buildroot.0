From: Pedro Aguilar <paguilar@paguilar.org>
Date: Sun, 30 Nov 2014 23:28:41 +0100
Subject: [Buildroot] [PATCH v5 4/4] guile: Add new package
In-Reply-To: <20141126215542.433523bf@free-electrons.com>
References: <1416869790-12988-1-git-send-email-paguilar@paguilar.org>	<1416869790-12988-5-git-send-email-paguilar@paguilar.org>
 <20141126215542.433523bf@free-electrons.com>
Message-ID: <547B9A19.6060705@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for helping me to fix and apply the patches!

I confirm you that guile is building and running fine for me, I used an 
Atmel SAMA5 processor.

Btw, do you use any script/tool for catching some of the missed things 
such as adding the wchar dependency to libunistring because it uses 
functions like wctomb()?

I would like to detect and fix these things before sending a patch so 
you don't have to check it again.

Regards,


On 26/11/2014 21:55, Thomas Petazzoni wrote:
> Dear Pedro Aguilar,
>
> On Mon, 24 Nov 2014 23:56:30 +0100, Pedro Aguilar wrote:
>> Guile is an interpreter and compiler for the Scheme programming
>> language, a clean and elegant dialect of Lisp.
>>
>> The patch guile-01-fix_arm_endianness.patch is based on guile's
>> git commit ^ffd3e55cfd
>>
>> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
>
> Applied to next, with a few changes:
>
>      [Thomas:
>       - rewrap comments and help text.
>       - add missing host-gettext dependency, since gettext.m4 is needed for
>         the package to autoreconf.
>       - add missing host-pkgconf dependency.
>       - add dependency on wchar, inherited from libunistring.]
>
> Don't hesitate to test the next branch, and verify that guile is
> building fine for you.
>
> Thanks!
>
> Thomas
>

-- 
Pedro Aguilar
http://paguilar.org
