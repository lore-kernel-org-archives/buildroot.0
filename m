From: =?utf-8?Q?=C3=89meric?= Vigier <emeric.vigier@savoirfairelinux.com>
Date: Thu, 19 Jul 2012 18:25:59 -0400 (EDT)
Subject: [Buildroot] [PATCH 0/1] Makefile: add variable print
 capabilities
In-Reply-To: <20120719220825.584bfb03@skate>
Message-ID: <928152212.982383.1342736759185.JavaMail.root@mail.savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Mail original -----
> Le Thu, 19 Jul 2012 15:01:17 -0400,
> Emeric Vigier <emeric.vigier@savoirfairelinux.com> a ?crit :
> 
> > I just got started with buildroot yesterday, and like it :-).
> > I am no Makefile expert, then often I turn into wanting to check
> > Makefile variables.
> > This patch adds a capability to do so by issuing:
> > 
> > $ make print-<myvariable>
> > 
> > e.g.
> > 
> > $ make print-DL_DIR
> > DL_DIR = /home/evigier/buildroot/dl
> 
> Hum, is this really useful? What are the use cases? What do other
> thinks about this?

It is somehow similar to Android's "get_build_var" which is very useful to me.
$ get_build_var TARGET_OUT
out/target/product/panda/system

But maybe there are other convenient ways to retrieve those INKTV (I never know the value) variables without grepping or reading Makefile and included ones?

> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> 

-- 
Emeric
