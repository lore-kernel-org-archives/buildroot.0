From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Wed, 30 Jul 2014 01:02:17 +0200
Subject: [Buildroot] [PATCH v4 1/1] New package: openvmtools
In-Reply-To: <20140729225132.GC5846@free.fr>
References: <1406635032-34970-1-git-send-email-kaszak@gmail.com>
 <20140729211549.GA5846@free.fr>
 <CABbD_XBsgVB7KQPwKoEJDz3JOJ61_2AJO=JtNOWy+yiRqgrTQQ@mail.gmail.com>
 <20140729225132.GC5846@free.fr>
Message-ID: <CABbD_XBoc9oNTSFOimkJWyY_5XJpF+nSVgPNeQCesUijJqHABg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> I used dropbear's startup script as a template, and the indentation is
> > exactly the same. Also with openssh, exim or ptpd (and possibly some
> > others). I think I should not differ from those too much?
>
> OK, I undersand. But those scripts were intially written a loooong time
> ago. We prefer that new submissions be a bit more coherent. Eventually,
> someone will clean up those old scripts. One day. Maybe... ;-)
>
> > Although you are right, it's on the end of the dropbear startup script
> and
> > 26 other initscripts in the package/ subdir. I think I should leave this
> to
> > stay consistent with the others as above.
>
> I prefer we introduce sane new scripts. As said above, the others are
> really old, and no longer up to nowadays standards...
>
> > Thanks again, I'll send a v5 patch soon. Regarding the init script, I can
> > use only spaces/tabs, but then this script will differ from the others.
> > Should I?
>
> Yes, new scripts should be cleaner and saner than the old ones.
>

OK, I'll rewrite it, and also I can start rewriting all the others later,
no problem.
Besides on consistent usage of tabs/spaces (I guess changing tabs to spaces
using 2 for indenting) and omitting the exit code, do you have any other
suggestions? Can you point me to some coding style for scripts that you
prefer?

BR
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140730/cc90fb03/attachment.html>
