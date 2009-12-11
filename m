From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 11 Dec 2009 14:23:25 +0100
Subject: [Buildroot] *Tons* of BR warnings like
	"package/Makefile.autotools.in:179: warning: overriding
	commands for target `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <20091211121818.675a61bf@surf>
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
	<4B221A6E.3090105@gmail.com>
	<5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
	<20091211121818.675a61bf@surf>
Message-ID: <5f2b60912110523u6905152cpd4082b247aa620ba@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/12/11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hello,
>
> Le Fri, 11 Dec 2009 11:36:28 +0100,
> Bj?rn Forsman <bjorn.forsman@gmail.com> a ?crit :
>
>> I'm on Ubuntu 9.10 Karmic amd64. I just tried BR on another machine
>> (also Karmic amd64) and the same thing happens there. I also tried to
>> symlink /bin/sh to /bin/dash on one of the machines. It didn't help.
>
> I cannot reproduce here. My buildroot version (from git) works well on
> a Karmic x86.
>
> Which version of Buildroot are you using exactly ? Which version of
> make does your system has ? Do you have any BUILDROOT_* environment
> variable set ?

BR version: HEAD as of now (1323ecdd094f0dd387bfe9db8c00cd9982ac1156)

Make version: 3.81

I don't have any BUILDROOT environment variables:
$ env | grep BUILDROOT     # nothing

I really think that some update to Ubuntu 9.10 Karmic amd64 has caused this
issue, because I have two machines with the same OS that show this behaviour
and I'm pretty sure that the BR versions not working now worked before.

Best regards,
Bj?rn Forsman
