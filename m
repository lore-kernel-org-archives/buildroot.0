From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Wed, 19 Nov 2008 00:00:36 +0100
Subject: [Buildroot] [PATCH] small patches (was: skeleton patch)
In-Reply-To: <20081118213442.GB19039@mx.loc>
References: <e4c675870811181121r169f9fcej6f8c2470bb46d34d@mail.gmail.com>
	<e4c675870811181146g39352c46tcaaa832bde6cf4c@mail.gmail.com>
	<20081118213442.GB19039@mx.loc>
Message-ID: <e4c675870811181500v2ba05c03v65140c706ed5e7e6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/11/18 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
> On Tue, Nov 18, 2008 at 08:46:04PM +0100, Roberto A. Foglietta wrote:
>
>> I think variable BR2_HAVE_DEVFILES should be renamed
>>BR2_HAVE_DEVEL_FILES because DEV sounds like /dev
>
> That's why that knob is named BR2_HAVE_INCLUDES here.
>

 I think includes are just a part of development environment and
gcc/binutils is necessary to in order to compile in the target system
for the target itself

 Please define "here"... I use the buildroot from its official svn and
I did not manage to find that knob!

roberto at rafbook:~/gles/buildroot$ grep -rn BR2_HAVE_INCLUDES toolchain/*
roberto at rafbook:~/gles/buildroot$ grep -rn BR2_HAVE_INCLUDES package/*
roberto at rafbook:~/gles/buildroot$ grep -rn BR2_HAVE_INCLUDES target/*
roberto at rafbook:~/gles/buildroot$ grep -rn BR2_HAVE_INCLUDES target/*
2>/dev/null
roberto at rafbook:~/gles/buildroot$ grep -rn BR2_HAVE_INCLUDES Config.in
2>/dev/null

 Thanks for the reply,
-- 
/roberto
