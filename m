From: Andreas Naumann <dev@andin.de>
Date: Wed, 19 Apr 2017 16:39:23 +0200
Subject: [Buildroot] [PATCH] Restore .git directory in git package
 downloads
In-Reply-To: <50405f08-370b-4d72-9130-d16479d61f9a@cesnet.cz>
References: <1492574439-4617-1-git-send-email-james@balean.com.au>
 <20170419041553.w2hxo7dqnzuaccan@sapphire.tkos.co.il>
 <50405f08-370b-4d72-9130-d16479d61f9a@cesnet.cz>
Message-ID: <a767627c-ac45-d05d-f71b-05a2ea1550d9@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 19.04.2017 um 15:01 schrieb Jan Kundr?t:
> On st?eda 19. dubna 2017 6:15:53 CEST, Baruch Siach wrote:
>> Is there anything missing for your use case?
>
> This is largely hypothetical (I don't know if any of these are packaged
> for Buldroot), but I know several projects which try to look at the
> output of `git describe` to create a pretty version string at build time
> (such as "v0.7-220-g270d875").

For me, a custom kernel from private git repo being is one such project. 
Right now I have a hack to append the shortened contents of 
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION via .scmversion. But of course this 
is not the same/as nice as what git describe or setlocalversion reports.

regards,
Andreas

>
> With kind regards,
> Jan
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
