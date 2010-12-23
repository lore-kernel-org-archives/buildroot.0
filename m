From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 23 Dec 2010 10:14:54 +0100
Subject: [Buildroot] [PATCH 1/4] Add CMAKETARGETS infrastructure for
	CMake packages
In-Reply-To: <20101223095403.21c714dd@surf>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTinkazQ2EzvCE46nSYmAkGiEJ3Ti+oM6=7g+u0Y5@mail.gmail.com>
	<AANLkTi=tmgB5T23WvH112P1YgrO-w+xjwtiU9=D01J90@mail.gmail.com>
	<AANLkTi=frxyYAzAaApiwAfxairhSKe38qkBgvk633_eF@mail.gmail.com>
	<20101223084644.018fa724@surf>
	<AANLkTinpJpLVjV7ogcT35GcX6RPfpG66k0hGQEkyfSko@mail.gmail.com>
	<20101223095403.21c714dd@surf>
Message-ID: <AANLkTin1J8Z4o0QKjnLGxs2Ui2kN9W5kFY-ATdyyU09+@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2010/12/23 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> On Thu, 23 Dec 2010 09:46:12 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> I actually chose to build in SRCDIR for the sake of consistency - autotools
>> packages build in SRCDIR :-)
>
> Oh, if CMake supports nicely the build-inside-source directory thing,
> then we can just use it as we do for autotools packages.

Yes. CMake has no problems with build-inside-source.

> I've been wondering whether we could build out-of-tree for autotools
> based packages, in order to share the source code between target and
> host package, and to ease the support of overriden packages, but I'm
> pretty sure we'll it a lot of problems with out-of-tree build in
> different packages, and it'll only work with autotools or cmake based
> packages. So the safest is probably to keep the build-inside-source
> mechanism we are currently doing.

Agree.

Best regards,
Bj?rn Forsman
