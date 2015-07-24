From: =?UTF-8?Q?Guillaume_GARDET_-_Olis=c3=a9o?= <guillaume.gardet@oliseo.fr>
Date: Fri, 24 Jul 2015 16:04:15 +0200
Subject: [Buildroot] [PATCH V2] c-icap: fix config script by adding
 $(STAGING_DIR) prefix to link path. It fixes c-icap-modules build.
In-Reply-To: <20150723231120.75b681e8@free-electrons.com>
References: <20150722155117.46a0e983@free-electrons.com>
 <1437641147-6894-1-git-send-email-guillaume.gardet@oliseo.fr>
 <20150723231120.75b681e8@free-electrons.com>
Message-ID: <55B245DF.8020401@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Le 23/07/2015 23:11, Thomas Petazzoni a ?crit :
> Dear Guillaume GARDET,
>
> On Thu, 23 Jul 2015 10:45:47 +0200, Guillaume GARDET wrote:
>> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> I applied, but quite a few things were still wrong with the patch:
>
>   * The commit title is too long. It should be less than 80 characters.
>     The commit title should only be a summary of the commit log itself.
>
>   * The commit title is wrong: you're no longer adding $(STAGING_DIR) to
>     the link path
>
>   * The commit log was missing a reference to the autobuilder failure
>     that this patch is fixing.
>
> I've fixed those problems and applied. See:
>
>    http://git.buildroot.net/buildroot/commit/?id=6c73215493335f1ede26cad2d3898ef543d871d6

Thanks.
I copy/paste V1 to V2 too quickly. Sorry.


Guillaume

>
> Thanks,
>
> Thomas
