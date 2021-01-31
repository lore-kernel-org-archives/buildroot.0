From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun, 31 Jan 2021 18:45:17 +0100
Subject: [Buildroot] Buildroot: Mono BoringSSL TLS provider
In-Reply-To: <CAAmaejpSEnLX4a8BCdyoNqaSmX6_XbCbGFKVLXth6b1kG_q3mg@mail.gmail.com>
References: <CAAmaejpSEnLX4a8BCdyoNqaSmX6_XbCbGFKVLXth6b1kG_q3mg@mail.gmail.com>
Message-ID: <CA+_SqVarm-VeGtmiFk9+HEguQObLY3q7XLG7qpL4AHKYudRS9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jonas,

Il dom 31 gen 2021, 18:39 Joonas Kataja <joonas.kataja@iki.fi> ha scritto:

> Hello Angelo,
>
> I noticed you have been maintaining the Buildroot Mono package and I would
> have a question about it.
>
> The BoringSSL TLS provider has been disabled in buildroot with
> '--disable-btls' configure option since it was introduced in version 4.8.
> The e7f62249 commit message mentioned "To be compiled inside buildroot it
> requires hacking the mono build system to pass the correct compiling
> options to cmake. This will be done in a future patch set."
>
> Is enabling btls still planned or was there unexpected difficulties? Would
> you have more specific tips for me regarding what exactly needs to be done
> to be able to enable btls?
>

I forwarded your email to the buildroot mailing list too.

Enabling btls is still planned.
The only reason is in my opinion the manpower, I cannot work on this in my
spare time for now.


> Thanks!
>
> Best regards,
> Joonas Kataja
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210131/06e8ce5b/attachment.html>
