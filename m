From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 22 May 2018 08:06:32 +0200
Subject: [Buildroot] [PATCH] modem-manager: disable -Werror
In-Reply-To: <87fu2kispe.fsf@dell.be.48ers.dk>
References: <20180521203923.21315-1-peter@korsgaard.com>
 <87fu2kispe.fsf@dell.be.48ers.dk>
Message-ID: <20180522060630.ivtpw7fwaioshuwv@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, Carlos,

> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>  > Fixes:
>  > http://autobuild.buildroot.net/results/5d9/5d9e299ff12726d07e8a584a213c1d2a2e419594/

>  > The modem-manager build generates a number of build warnings like:

>  > mm-base-manager.c: In function 'handle_set_logging':
>  > mm-base-manager.c:680:15: error: assignment from incompatible pointer type [-Werror]
>  ctx-> self = g_object_ref (manager);

>  > Which cause a build failure because of -Werror.  Pass
>  > --disable-more-warnings to disable -Werror.

>  > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

> Committed, thanks.

Peter, thanks for fixing this issue.
Carlos, thanks for handling this issue (IMHO you could have assign yourself as modem-manager
developer in DEVELOPERS).


Kind regards,
Petr
