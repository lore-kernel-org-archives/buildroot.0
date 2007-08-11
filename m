From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 11 Aug 2007 13:50:30 +0300
Subject: [Buildroot] Toolchain keeps rebuilding, SVN 19422
In-Reply-To: <20070810191711.GA6034@marvin.netwinder.org>
References: <20070810191711.GA6034@marvin.netwinder.org>
Message-ID: <46BD9476.1040208@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ralph Siemsen ?????:
> Just wondering if anyone else has noticed this, before I go and
> spend time trying to figure out why.  It seems on every "make"
> that substantial parts of gcc are getting rebuilt.  I'm fully
> up-to-date except for the x7 commit that just went through.
> 
> Anyone else experiencing this?
> -R

No, i have all ok, it seems timestamp problem of some Makefiles in your setup
  - may be your PC clock are screwed up.

BR,
Ivan

> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
