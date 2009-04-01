From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 31 Mar 2009 23:43:09 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils
	external-toolchain gcc uClibc
In-Reply-To: <20090401012841.585dc38e@surf>
References: <20090130162827.2A05D765E9@busybox.osuosl.org>
	<20090330153259.0a7ee398@surf> <87ab73azsj.fsf@macbook.be.48ers.dk>
	<20090330175842.1960fed2@surf> <87prfyald1.fsf@macbook.be.48ers.dk>
	<d6cda7730903301256r2e9adf8bmf613118daf62eb61@mail.gmail.com>
	<20090401012841.585dc38e@surf>
Message-ID: <d6cda7730903311943o576aa1a9p932aecc9f5ada27f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2009/3/31 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Mon, 30 Mar 2009 16:56:54 -0300,
> Thiago A. Corr?a <thiago.correa@gmail.com> a ?crit :
>
>> Would that be a bad thing? Even if it's not integrated but a script,
>> say: ./script/fix-external-toolchain.sh
>>
>> Before/after running kconfig.
>>
>> It beats having the user to guess or remember.
>
> Or maybe we could just *not* show these options, and let a script
> auto-detect the values. For uClibc, they can easily be guessed from
> some uClibc-config.h script available in the toolchain.
>

It must be "guessed" before entering kconfig because of the package
options that depend on them. Specially large file support and IPv6.

Kind Regards,
   Thiago A. Correa
