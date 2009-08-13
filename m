From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 13 Aug 2009 11:43:27 -0300
Subject: [Buildroot] Explicit dependencies on uclibc in makefiles
In-Reply-To: <20090813163709.044199e3@hcegtvedt.norway.atmel.com>
References: <87a5b0800908110855g778df6aanbf9307ca69e676c9@mail.gmail.com>
	<d6cda7730908130705s11275a7cu78d2dbca3ee15041@mail.gmail.com>
	<87a5b0800908130719m79b677dbm1e3c12bd9dafddaf@mail.gmail.com>
	<20090813163709.044199e3@hcegtvedt.norway.atmel.com>
Message-ID: <d6cda7730908130743ic7fa66fy5f32814fc828d887@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/8/13 Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>:
> On Thu, 13 Aug 2009 15:19:48 +0100
> Will Newton <will.newton@gmail.com> wrote:
>
> <snipp>
>
>> Why does bash depend on uclibc but grep doesn't? Does grep have a bug
>> or can we remove the unneeded dependency from bash?
>>
>
> IIRC uclibc is earlier in the dependency loop anyway, uclibc is in the
> BASE_TARGETS list. See top level Makefile.
>

Ah, ok. I never looked it up at the top Makefile. Well, then I guess
we could drop uclibc from all packages/*
This actually should be done for the glibc support to work properly I guess.

Kind Regards,
   Thiago A. Correa
