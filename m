From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 2 Feb 2011 01:40:12 -0500
Subject: [Buildroot] [uclinux-dist-devel] [PATCH] buildroot:package:
 Remove configure target parameter in Makefile.autotools.in
In-Reply-To: <AANLkTinx51twX6nF5Yxn7iZbNbaocvsrpGp1YUoSTrOT@mail.gmail.com>
References: <1296532330-24961-1-git-send-email-sonic.adi@gmail.com>
	<AANLkTi=F8BRtskBBKE_Wno=Vy=EHvLjE3bkYagiAuegH@mail.gmail.com>
	<AANLkTikMtTC3zOWCOQDLGWpv3h=-rUiQwVa4fAN07rBM@mail.gmail.com>
	<87vd14urk2.fsf@macbook.be.48ers.dk>
	<AANLkTinx51twX6nF5Yxn7iZbNbaocvsrpGp1YUoSTrOT@mail.gmail.com>
Message-ID: <AANLkTi=ZuWp-6kbBRt+8Yz7OwQz4ODGWeSk9kSjs=VbZ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 1, 2011 at 23:49, Sonic Zhang wrote:
> On Tue, Feb 1, 2011 at 3:45 PM, Peter Korsgaard wrote:
>>>>>>> "Sonic" == Sonic Zhang writes:
>>
>> ?Sonic> Some autotools based software packages generate prefix name to the
>> ?Sonic> binary after running install if you set --target parameter.
>>
>> ?Sonic> For example:
>>
>> ?Sonic> --target=arm
>>
>> ?Sonic> rcp is rename to "linux-arm-rcp" after running install
>>
>> These packages typically accept the configure options
>> --program-transform-name to make them not do that.
>
> Yes, but for some packages, --host and --target are not the same as
> defined in buildroot.

yes they are

> For example, to build on x86, run on arm and generate binary for mips.

but that is what we're doing.  we build on x86, run on arm, and
generate for arm.
-mike
