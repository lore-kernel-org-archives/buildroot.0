From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 13:52:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-31
In-Reply-To: <20190401104923.GA11724@lwo1-lhp-f71841>
References: <20190401060047.F38C78756C@hemlock.osuosl.org>
 <20190401104923.GA11724@lwo1-lhp-f71841>
Message-ID: <20190401135220.516995ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadym,

On Mon, 1 Apr 2019 13:49:23 +0300
Vadym Kochan <vadim4j@gmail.com> wrote:

> It looks like the problem happens because these builds has only python3
> and scons fails when runs SConstruct file which looks like python2
> script (at least by using print '') ?

Yes, see the discussion in http://patchwork.ozlabs.org/patch/1071625/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
