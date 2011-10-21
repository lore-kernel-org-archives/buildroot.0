From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 21 Oct 2011 12:17:19 +0200
Subject: [Buildroot] [RFC] Gerrit for BR
In-Reply-To: <87ehy6942n.fsf@macbook.be.48ers.dk>
References: <4EA02C2A.6070405@visionsystems.de>
 <20111021085714.2e661569@skate> <87ehy6942n.fsf@macbook.be.48ers.dk>
Message-ID: <4EA146AF.6090402@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.10.2011 09:49, schrieb Peter Korsgaard:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
>  >> What do you think about using Gerrit
>  >> (http://code.google.com/p/gerrit/) for Buildroot? Many OSS projects
>  >> seem to switch to this system.
> 
>  Thomas> How does it compare to patchwork (http://patchwork.ozlabs.org/)
>  Thomas> ?  Patchwork works in relation to a mailing-list, from which it
>  Thomas> automatically picks up patches and related review comments, and
>  Thomas> it allows maintainers to track which patches have been
>  Thomas> applied/not applied.
> 
>  Thomas> How does Gerrit work in that respect?
> 
> I don't have any hands on experience (but I am following the openocd
> list, so I see it used), and my initial feeling is that something like
> patchwork would fit better our current way of working.
> 
> But that's just an initial feeling, let's discuss at ELC and/or here on
> the list.

Peter, you just mentioned yourself, that you're following openocd list. Please see this thread for pros contra etc.
http://www.mail-archive.com/openocd-development at lists.berlios.de/msg18509.html

As far as I understand Gerrit integrates very good with Git and when used properly and by all contributors, you'll have all the patches in one place. The patches can be then commented online and you'll also get history for reworked patches. As soon as patches are verified, maintainer (you :-) ) can merge them with one click. These were the benefits Gerrit would bring Buidroot community. I think such approach makes sense, since lots of patches will be sent almost every day.

And as far as I understand from the openocd list thread mentioned above, patchwork still requires more handwork from maintainer than Gerrit.

Yegor
