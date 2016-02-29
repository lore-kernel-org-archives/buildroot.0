From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 29 Feb 2016 22:59:44 +0100
Subject: [Buildroot] [PATCH/next v9 00/28] package/freeswitch: new
	package
In-Reply-To: <20160229223307.250b8c8c@free-electrons.com>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
 <20160229223307.250b8c8c@free-electrons.com>
Message-ID: <56D4BF50.2020803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, Thomas, All,
Le 29/02/2016 22:33, Thomas Petazzoni a ?crit :
> Bernd,
> 
> On Sat, 27 Feb 2016 16:26:50 +0100, Bernd Kuhls wrote:
> 
>> this patch series splits my previous patch into smaller chunks for easier
>> review as requested by Luca and Thomas. I also removed all options from
>> Config.in.
>>
>> Instead of enabling or disabling modules in the upstream modules.conf I
>> decided to delete that file in the first patch to provide a minimal
>> build for easier review, please keep in mind that I never did a run-time
>> test with this minimal version. A lot of modules, desired as a default
>> set, are added with the second patch - all of them have no external
>> dependencies. The rest of the patch series consists of modules having
>> some form of dependency, added module by module for easier review.
> 
> Thanks for this patch series. Besides my build issue and minor comments
> on PATCH 01/28, it looks fine. I've looked at all other patches, and
> despite a really minor nit on PATCH 26/28, I think we'll be able to
> apply this once the PATCH 01/28 problems are fixed.
> 
> The fact that you did split the package addition in a minimal package
> and then trivial additions of optional dependencies really made the
> whole thing a lot easier to look at and review, so thanks for having
> done that!

+1

Also, I tried to force the build system to use apr and apr-util libraries
provided by Buildroot packages, but It's not easy without deep modifications and
breaking a lot of stuff :-(

Let's hope that the further release will have a better build system...

Best regards,
Romain

> 
> Thomas
> 
