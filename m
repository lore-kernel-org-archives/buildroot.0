From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 22:27:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-reentry: add host variant
In-Reply-To: <CALFsTFXTicPF07+mTzSsM4apHCM_jEis66TEFV2ASoSo5+gk2g@mail.gmail.com>
References: <20191020190142.18672-1-asafka7@gmail.com>
 <20191020190142.18672-2-asafka7@gmail.com>
 <20191021100502.1fb37965@windsurf.home>
 <CALFsTFXTicPF07+mTzSsM4apHCM_jEis66TEFV2ASoSo5+gk2g@mail.gmail.com>
Message-ID: <20191022222707.21f2d917@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 12:00:49 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> > Why do we need a host variant for python-reentry ?  
> 
> That's because packages which use reentry will probably have

"probably" ?

> setup_requires=['reentry'] and reentry_register=True in their
> setup.py.
> On installation, reentry creates a file with the registered
> entrypoints that you can read on the target when you need to load
> them.
> Maybe I should send a v2 and explain that in the commit?

Yes, we will need a better commit log, but more importantly, do we have
any package in Buildroot that needs this ? Or is it custom/private
packages that you have ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
