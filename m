From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 28 Nov 2013 06:33:52 -0600
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile	code to be integrated
In-Reply-To: <20131128132914.1e0a6ae2@skate>
References: <20131128094342.3f6c84e4@skate>	<1745239489.15294056.1385631446992.JavaMail.root@openwide.fr>
 <20131128123359.6341f14e@skate>	<OF48FFD9A9.EDDCA00F-ON86257C31.0040FD2E-86257C31.0042CA75@rockwellcollins.com>
 <20131128132914.1e0a6ae2@skate>
Message-ID: <OF175E2603.3360BA51-ON86257C31.0044CA92-86257C31.0045046E@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 11/28/2013 
06:29:14 AM:

> I don't think anything special is needed. With the current patch set
> (v3), if the package/Config.in file is missing in the BR2_EXTERNAL
> directory, the error is quite obvious:
> 
> $ make BR2_EXTERNAL=/tmp/koin menuconfig
> package/Config.in:1000: can't open file "/tmp/koin/package/Config.in"
> make: *** [menuconfig] Error 1
> $
> 
> (The /tmp/koin directory is empty)

Ah - then I agree that the current form is sufficient enough.

Thanks,
-Ryan
