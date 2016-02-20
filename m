From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 20 Feb 2016 13:48:22 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain-external: CodeSourcery NiosII
 2015.11 affected by PR19405
In-Reply-To: <87fuwrxc3z.fsf@dell.be.48ers.dk>
References: <1455316403-7793-1-git-send-email-romain.naour@gmail.com>
 <87fuwrxc3z.fsf@dell.be.48ers.dk>
Message-ID: <56C86096.4060207@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Peter,

Le 17/02/2016 22:26, Peter Korsgaard a ?crit :

>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
>   > Fixes:
>   > http://autobuild.buildroot.net/results/ee562524c5b12191e584ceae89006c5a5103e700
>
>   > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>   > ---
>   >  package/grantlee/Config.in             | 1 +
>   >  package/opencv/Config.in               | 1 +
>   >  package/opencv3/Config.in              | 1 +
>   >  package/pinentry/Config.in             | 1 +
>   >  package/poppler/Config.in              | 1 +
>   >  package/qt/Config.in                   | 7 +++++++
>
> Hmm, why are we only adding a comment to qt and not all these other
> packages?

I wasn't sure if we want to add a comment for a toolchain bug.
Hopefully the list of packages affected by this bug is not so long.

>
> It would be good to add a link to the upstream bugtracker in the commit
> description / where the kconfig symbol is added.

See, v2 http://patchwork.ozlabs.org/patch/585613/
Sorry, I forgot to add v2 in the tittle :-/

Best regards,
Romain

>
>
