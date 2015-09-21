From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Sep 2015 11:34:04 +0200
Subject: [Buildroot] [PATCH v7 1/1] squeezelite: new package
In-Reply-To: <55FFC362.8050106@imgtec.com>
References: <201509210347.t8L3lcth017495@ms-omx02.plus.so-net.ne.jp>
 <55FFC362.8050106@imgtec.com>
Message-ID: <20150921113404.5412db51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Mon, 21 Sep 2015 09:44:18 +0100, Vicente Olivert Riera wrote:

> > +ifeq ($(BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE),y)
> > +	SQUEEZELITE_MAKE_OPTS += -DRESAMPLE
> > +	ifeq ($(BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP),y)
> > +		SQUEEZELITE_MAKE_OPTS += -DRESAMPLE_MP
> > +	endif
> > +endif
> 
> I think the Buildroot style is to not indent this code. Can other dev
> tell me if I'm wrong?

You're correct.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
