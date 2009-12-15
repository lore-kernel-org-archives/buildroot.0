From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 15 Dec 2009 09:31:05 +0100
Subject: [Buildroot] SYSROOT_DIR issue with external toolchains
In-Reply-To: <20091214234340.714eb09b@surf>
References: <5f2b60912141113n33fa36f1mdd45dc55313301c3@mail.gmail.com>
	<20091214234340.714eb09b@surf>
Message-ID: <5f2b60912150031r18adf152hb7e0a14e08aebbbc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/12/14 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Mon, 14 Dec 2009 20:13:44 +0100,
> Bj?rn Forsman <bjorn.forsman@gmail.com> a ?crit :
>
>> SYSROOT_DIR=$(shell $(TARGET_CC) -print-sysroot)
>>
>> Is there any problem with this change?
>
> Yes, it doesn't work with all gcc versions.

I was afraid so.

> I have
> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=2907415d82b7d306ca3f1f1ead0bbb0c7f1505c3
> in my patch queue. Something I should clean up, test and submit.

Your patch is exactly what I want:-) Thanks!

Best regards,
Bj?rn Forsman
