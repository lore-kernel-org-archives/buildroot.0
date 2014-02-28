From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Fri, 28 Feb 2014 11:29:00 -0500
Subject: [Buildroot] [PATCH v2] libdrm: bump to 2.4.52 and remove
 useless dependencies on libpciaccess
In-Reply-To: <20140227234426.324e0e42@skate>
References: <1393539908-14365-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <20140227234426.324e0e42@skate>
Message-ID: <5310B94C.3020805@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Bernd

On 02/27/2014 05:44 PM, Thomas Petazzoni wrote:
> Thanks a lot for your contribution!
>
> However, the patch has two problems:
>
>  *) You added a significant change (bumping the version number), but
>  you kept the Reviewed-by tag of another person. This is typically
>  considered as a bad practice: Arnout had endorsed your previous
>  version, and maybe not this one.
>
>  *) When your commit log title contains something like "do this *AND*
>  do that", it's a strong indication that your patch is not correct, and
>  should instead be split in two patches: one "doing this" and the other
>  "doing that". In this case, the patch "doing that" could carry
>  Arnout's Reviewed-by, since it wouldn't have changed since Arnout's
>  review.
>
> Would you mind resending an updated version that takes into account
> those comments?
>
> Thomas
Thanks for your advice Thomas, i'll keep it in mind.

On 02/27/2014 05:44 PM, Bernd Kuhls wrote:
> Hi,
>
> please have a look at this patch series addressing the same topic:
>
> http://patchwork.ozlabs.org/patch/317523/
> http://patchwork.ozlabs.org/patch/317522/
> http://patchwork.ozlabs.org/patch/317524/
>
> Regards, Bernd
Bernd i saw some of your patches but not this one sorry.
My patch is redundant with Bernd's patches, so you can burn mine :)

Regards.
