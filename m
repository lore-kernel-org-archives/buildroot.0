From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 15 Oct 2007 02:34:34 +0300
Subject: [Buildroot] Libtool error with AVR32
In-Reply-To: <20071014200947.GA27861@reid1.localdomain>
References: <20071014200947.GA27861@reid1.localdomain>
Message-ID: <4712A78A.7090003@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> configure: error:
> 
> *** [Gentoo] sanity check failed! ***
> *** libtool.m4 and ltmain.sh have a version mismatch! ***
> *** (libtool.m4 = 1.5.24, ltmain.sh = "1.5.22 Debian 1.5.22-4") ***
> 
> Please run:
> 
>   libtoolize --copy --force
> 

Have you tried to run "libtoolize --copy --force" manually?


BR,
Ivan
