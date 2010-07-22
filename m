From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 21 Jul 2010 23:29:03 -0300
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <201007220352.37255.PeterHuewe@gmx.de>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
	<201007220352.37255.PeterHuewe@gmx.de>
Message-ID: <AANLkTikKS2AppP8zpPudDFbKvchDZvlpfQeTb-TKKvT2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

2010/7/21 Peter H?we <PeterHuewe@gmx.de>:
>
> thanks for reporting this issue.
> I'll have a look into it - currently the code still compiles :)

What do you mean it still compiles?
I get an error building the toolchain, something along the lines of:

make[3]: *** Waiting for unfinished jobs....
/root/buildroot-head/output/toolchain/gcc-4.2.2-avr32-2.1.5-final/./gcc/as:
line 2: exec: --: invalid option
exec: usage: exec [-cl] [-a name] [command [arguments ...]] [redirection ...]
make[3]: *** [crtbeginS.o] Error 1


> Meanwhile, maybe you could post the results of the build, i.e. the build
> failure / error messages here, or use a pasting service like
> http://dpaste.com/ and then post the link here.
>

This is what my ssh window had in it's buffer: http://dpaste.com/220727/

I can get a full log if needed. I get this with HEAD and
8e8103bfb55a814d68eabb51afebfb35c3e7cec8
But not with 4fdecac9d692b8d6f071ba6ad938b6ad68b675fd

Thanks,
    Thiago A. Correa
