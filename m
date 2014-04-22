From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Tue, 22 Apr 2014 14:21:12 -0300
Subject: [Buildroot] [PATCH 1/1] mysql: fix build failure on MIPS
In-Reply-To: <20140421152054.2e3fbbdc@skate>
References: <1396216131-3222-1-git-send-email-kuyurix@gmail.com>
 <20140421152054.2e3fbbdc@skate>
Message-ID: <CA+kK6WvAp_ZTEdXAG9XrJE_bL1QAwjDmyRxZa794DbYDhMeRWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks, but I've fixed the problem in a different way, see
>
> http://git.buildroot.net/buildroot/commit/?id=8104fd72ed6fee97f024ec75a4ed81231e2777b8
> .
> Basically disabling the maintainer mode of MySQL (which is meant for
> MySQL developers) allows to get rid of -Werror and solves the build
> issue.
>

I glad you found a better solution!!!

BTW, do you plan to upgrade MySQL to a more recent version? The 5.1.x
> version we use seems to be quite old, no?
>

Yes, the latest version of MySQL is "5.6.x", but I never used it on an
embedded system, so I can't tell you if will work on this kind of systems.

Regards,
Marcelo Guti?rrez
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140422/59867f87/attachment.html>
