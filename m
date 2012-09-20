From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Sep 2012 20:47:30 +0200
Subject: [Buildroot] [PATCH 0/11 v3] Rework the gettext handling
In-Reply-To: <201209201850.56066.yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <505A4CD8.80900@mind.be>
 <201209201850.56066.yann.morin.1998@free.fr>
Message-ID: <20120920204730.75b79901@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 20 Sep 2012 18:50:55 +0200, Yann E. MORIN wrote:

> My goal with the series was not to fix anything (except for the required
> fixes), but rather to improve on the existing infrastructure.

Agreed.

> Fixing anything that would break after the series, and that was already
> broken before the series, was not the goal. This can come in a later
> series [0], if such fixes are needed.
> 
> [0] Admitedly, it could (should?) even come before the series, but fixing
>     packages is really different from improving the infrastructure.
> 
> That being said, we now have a few venues to deal with this series:
>   0- drop the series entirely,
>   1- postpone this series until after all packages have been fixed,
>   2- finalise the series so it is fully agreed-on, apply it, then fix
>      packages,
>   3- get a benevolent dictator to agree the whole series for good,
>      apply it, then we can fix the packages,
>   4- apply all agreed-on patches (eg. 1-4, 6), then fix all packages,
>      then refine/drop currently not agreed-on patches.
>   5- apply all agreed-on patches (eg. 1-4, 6), then refine/drop the
>      rest of the series, apply it, and fix packages,
> 
> Hopefully, we all agree that 0 is out-of-question. ;-)
> 
> Although 1 would be the best technical solution, it is (IMHO) not the
> best from a practical point of view.
> 
> Going with 2 means another long round-trip, as there is at least one
> opposition to this series (although I hope Thomas can be coerced into
> approving the series! ;-p ).
> 
> 3 is not the best course of action, we still have not reached consensus
> on the technical (de)merits of the series (specifically the end of it).
> 
> I do not have a strong feeling between 4 and 5, although, from a personal
> position, I'd say we should go for 5, so I can get rid of this series
> entirely (and switch to other interesting stuff! ;-) ).

Peter, can you please apply now patches 1 to 8 in this series, so the
volume of the series reduces and we can more easily work on an
agreement for the remaining patches?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
