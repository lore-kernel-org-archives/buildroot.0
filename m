From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Dec 2013 16:34:23 +0100
Subject: [Buildroot] [PATCH v10 0/8] Add support for top-level parallel
	make
In-Reply-To: <CAHkwnC9J_4GOPSLtP2KWLD9YipFV+hVadXc_RrkjvNoYQ2oJew@mail.gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <52B32DF1.2010702@mind.be>
 <CAHkwnC9J_4GOPSLtP2KWLD9YipFV+hVadXc_RrkjvNoYQ2oJew@mail.gmail.com>
Message-ID: <20131220163423.4574d257@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 20 Dec 2013 15:36:56 +0100, Fabio Porcedda wrote:

> The autobuild does not try to test allpackageyesconfig, does it?

But, the autobuild is not designed for that. However, an
allyespackageconfig configuration is something we could add to the
Jenkins if you want.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
