From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 5 Apr 2013 08:49:33 -0700
Subject: [Buildroot] [PATCH] aircrack-ng: needs toolchain with threads
	support
In-Reply-To: <515EABA6.8000302@zacarias.com.ar>
References: <1365116959-25148-1-git-send-email-gilles.talis@gmail.com>
 <515EABA6.8000302@zacarias.com.ar>
Message-ID: <CAKcgs2xxZU8VonB3DKraPswaz2TAHnyohEiYXPx2StKQXDRvrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 5, 2013 3:47 AM, "Gustavo Zacarias" <gustavo@zacarias.com.ar> wrote:

> On 04/04/2013 08:09 PM, Gilles Talis wrote:
>
> > Fixes:
> >
> http://autobuild.buildroot.org/results/418c9385a9a5a5087a6790001560056d32cd9708
> >
> > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
>
> Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # iw
>
> However it's not because of iw, it's because of aircrack itself
> (aircrack is failing to compile) :)
>

Fully right :-).  Meant to show to iw ALSO had that dependency. But I
realize that my comment does not reflect that at all :-)
Thanks for the ack.
Regards
Gilles.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130405/3ef62dcf/attachment.html>
