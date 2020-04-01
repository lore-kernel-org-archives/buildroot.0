From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 1 Apr 2020 13:41:37 -0300
Subject: [Buildroot] kmscube: cannot fetch from cgit.freedesktop.org
In-Reply-To: <9157c7b4-716b-dd9d-3ab7-5ff7ce411183@mind.be>
References: <CAOMZO5B2ox8cpL8rMGrqD=gDg7-PVyiV7T_ci_8zFfSFMSq-Og@mail.gmail.com>
 <9157c7b4-716b-dd9d-3ab7-5ff7ce411183@mind.be>
Message-ID: <CAOMZO5Bw9wnWCKBRfYY+f=6uzoucs5SiLFxd1HBRVwNdY4AMYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Apr 1, 2020 at 1:37 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>  Indeed, cgit doesn't have archive downloads, so this wouldn't work.
>
> [snip]
> > wget "https://gitlab.freedesktop.org/mesa/kmscube/repository/archive.tar.gz?ref=4660a7dca6512b6e658759d00cff7d4ad2a2059d"
> > -O archive.tar.gz
>
>  The proper way would be:
>
> KMSCUBE_SITE =
> https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)

Excellent, this works! Will submit a patch soon.

Thanks for your help
