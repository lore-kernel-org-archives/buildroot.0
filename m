From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 28 Feb 2013 17:06:48 +0200
Subject: [Buildroot] Help needed with cross-compiling libotr
In-Reply-To: <512F71F7.20409@petroprogram.com>
References: <512F71F7.20409@petroprogram.com>
Message-ID: <512F7288.6040205@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

28.2.2013 17:04, Stefan Fr?berg kirjoitti:
> Hello all
>
> I have been trying to cross-compile libotr package that makes it possible,
> with the help of pidgin-otr plugin, to send encrypted messages with
> Pidgin IM software
> (which I already have successfully cross-compiled for buildroot and plan
> to submit soon).
>
> Now, the problem is that no matter what I do that damn package picks
> "-I/usr/include" somewhere
> and the build will fail complaining about undefined reference to
> __isoc99_sscanf (which it picks wrongly from
> host system stdio.h).
>
> Several remakes, autoreconf and configure switche changes and still no
> closer to success.
>
> Even grepped the source for -I/usr/include and the only place it shows
> it is from
> something called oldinclude from configure file...
>
> Im totally lost here.
>
> Could somebody more knowledgeable about autoconf/make please take a look
> of this package ?
> It's not big and the only dependencies it needs are libgcrypt and
> libgpg-error
>
> It can be downloaded from here:
> http://www.cypherpunks.ca/otr/pidgin-otr-4.0.0.tar.gz

Ach!
I meant from here:
http://www.cypherpunks.ca/otr/libotr-4.0.0.tar.gz
