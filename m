From: Brendan Heading <brendanheading@gmail.com>
Date: Fri, 21 Aug 2015 12:38:33 +0100
Subject: [Buildroot] Analysis of build results for 2015-08-18
In-Reply-To: <20150821104622.3abb16d1@free-electrons.com>
References: <20150819063013.E74B810154B@stock.ovh.net>
 <20150819224105.2993bbe5@free-electrons.com>
 <CA+BsyQ7iPgOxOOY+vi09shjAJMhkaFQBcfe6EEJxmX_kVPh21A@mail.gmail.com>
 <20150821104622.3abb16d1@free-electrons.com>
Message-ID: <CA+BsyQ6a=2Lt5Q8XGmT4EegWFnj1b6FeV_EU3KNRGUTXx5PCtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Leaving things broken in the autobuilders is annoying. For two reasons:
>
>  1/ Due to this Busybox failure on SPARC, many SPARC builds abort at
>     this point, and we don't see other SPARC failures.
>
>  2/ It leaves some "noise" in the build results, and due to this it's
>     hard to distinguish the build failures that should be investigated
>     from the ones that are already analyzed.

Understood. Would you like me to put together a "disable libtirpc on
SPARC" patch then ?

We can make it temporary, like the one I submitted for libpam.

> I doubt we can get this merged for 2015.08, though. It will probably be
> 2015.11 material.
>
> In any case, thanks a lot for working on this libtirpc topic, it has
> been around for a while, so it's good to have someone looking into this!

Not at all, it's fun. Kind of like pulling teeth. ;) And it's been
great to learn the ropes in terms of submitting things to open source
projects too.

regards

Brendan
