From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 3 Apr 2018 18:57:57 +0200
Subject: [Buildroot] [PATCH] wine: Depend on shared libraries
In-Reply-To: <20180331224300.78d89111@windsurf>
References: <1521143154-19605-1-git-send-email-nerv@dawncrow.de>
 <20180331224300.78d89111@windsurf>
Message-ID: <b69b9c19-bafe-7681-5f77-4df02fc3e209@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 31.03.2018 um 22:43 schrieb Thomas Petazzoni:
> Hello,
> 
> On Thu, 15 Mar 2018 20:45:54 +0100, Andr? Hentschel wrote:
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> 
> I did a test build, and indeed discovered that wine tries to
> unconditionally build a shared library.
> 
> I've added a Config.in comment, which required adding a
> BR2_PACKAGE_WINE_ARCH_SUPPORTS hidden boolean, and extended the commit
> log significantly to explain why we do this change.
> 
> And then I've applied.
> 
> Thanks,
> 
> Thomas
> 

Thanks for that! Had no time for it yet
