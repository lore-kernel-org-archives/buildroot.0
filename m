From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 16:40:42 +0100
Subject: [Buildroot] [PATCH 1/1] open-lldp: new package
In-Reply-To: <CAGm1_kstjv26G48Kmb=SEWMhn7S032voR+5qGk8cvURt0kTNHQ@mail.gmail.com>
References: <20180112140107.15301-1-laurent_pubs@yahoo.com>
 <CAGm1_kvL9UWVX5jrzE1dhsOHvWT_LukRJKZ5z6eu8Tma0bjXdw@mail.gmail.com>
 <20180112220436.677e3084@windsurf.lan>
 <CAGm1_ksP2c_gLsSCJjN=Sr7gK0OR0Bdxd-jidXVhjgwOCFyiwQ@mail.gmail.com>
 <20180112233842.388e29a0@windsurf.lan>
 <276755364.2420280.1516020636845@mail.yahoo.com>
 <CAGm1_ktPX4fMyRO-A2dAcAR3ygj7kFxsbV+wex6imWxn--bMpw@mail.gmail.com>
 <1209491448.2489150.1516029313233@mail.yahoo.com>
 <CAGm1_kstjv26G48Kmb=SEWMhn7S032voR+5qGk8cvURt0kTNHQ@mail.gmail.com>
Message-ID: <20180115164042.168b6197@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Jan 2018 16:21:13 +0100, Yegor Yefremov wrote:

> > define OPEN_LLDP_PRE_CONFIGURE_HOOKS
> >         (cd $(@D) && mkdir -p m4)
> > endef  
> 
> Yes.

Minor nit:

	mkdir -p $(@D)/m4

is sufficient. No need to "cd" into that folder.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
