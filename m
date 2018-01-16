From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 15:13:47 +0100
Subject: [Buildroot] [PATCH v2] open-lldp: new package
In-Reply-To: <CAGm1_kv00hg9GJbuOKQt39sAK4p55mzCM332PT7mLcEZBNR64A@mail.gmail.com>
References: <20180116074128.4251-1-laurent_pubs@yahoo.com>
 <CAGm1_kv00hg9GJbuOKQt39sAK4p55mzCM332PT7mLcEZBNR64A@mail.gmail.com>
Message-ID: <20180116151347.5c1efcb3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 08:56:43 +0100, Yegor Yefremov wrote:

> > +OPEN_LLDP_VERSION = 036e314bd93602f7388262cc37faf8b626980af1
> > +OPEN_LLDP_SITE = git://open-lldp.org/open-lldp.git
> > +OPEN_LLDP_DEPENDENCIES = readline libnl libconfig  
> 
> @Thomas should host-pkgconf be also added to the list of dependencies?

Well, it depends if it's used or not :)

If pkg-config is used by the configure script, then yes, otherwise no.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
