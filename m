From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 10:00:41 +0200
Subject: [Buildroot] [PATCH 3/3] alsaequal: new package
In-Reply-To: <53E1442A.9020302@barkynet.com>
References: <1398374384-8814-1-git-send-email-martin@barkynet.com>
 <1398374384-8814-3-git-send-email-martin@barkynet.com>
 <20140804223202.62f5c129@free-electrons.com>
 <53E1442A.9020302@barkynet.com>
Message-ID: <20140806100041.107a2524@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Tue, 05 Aug 2014 21:52:58 +0100, Martin Bark wrote:

> > Description + Signed-off-by.
> 
> Some of these patches are copies from debian patches hence they lack the 
> description and Signed-off-by.  I'll fix this and resubmit.

No problem with patches coming from Debian, but please indicate where
they are coming from.

> > Same comments here for $(TARGET_MAKE_ENV) and $(TARGET_CONFIGURE_OPTS)
> > as the ones made on the 'caps' package.
> >
> > So there's really no build dependency on ladspa or caps in alsaequal ?
> 
> alsaequal loads the caps 10 band equaliser at runtime hence caps is not 
> a build dependency but is a dependency in Config.in.

Ok. Maybe put a comment about this somewhere in the Config.in or .mk
file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
