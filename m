From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 3 Oct 2015 23:34:09 +0200
Subject: [Buildroot] [PATCH 1/1] Fix umask settings for non-bash shells
 for root user
In-Reply-To: <87bndquxne.fsf@dell.be.48ers.dk>
References: <1434378026-15007-1-git-send-email-vorel@jablocom.com>
 <20150829105707.3d5e0fec@free-electrons.com> <20150829092037.GA4857@free.fr>
 <55E18457.3080302@mind.be> <87bndquxne.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivxRtnN7QLt6gubAP8NT6yyfjdHRprGgfBQHT8ZMZGcamw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr, all

The idea behind that patch has be respinned and reworked into a series to
cleanup /etc/profile a little bit.
You can find it there:
http://lists.busybox.net/pipermail/buildroot/2015-October/140786.html

Thank you very much.

On Sat, Aug 29, 2015 at 1:44 PM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>  >> My opinion? Here's what I'd do ;-)
>  >>
>  >> git rm system/skeleton/root/.bash_*
>
>  >  +1
>
>  >  Even when bash is the default shell, none of these are needed IMHO.
>
> +1 from here as well (for 2015.11).
>
> --
> Venlig hilsen,
> Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151003/e4c74e65/attachment.html>
