From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:55:14 +0200
Subject: [Buildroot] [PATCH 08/23] qt: remove no longer needed
 'x86x86fix' workaround
In-Reply-To: <1254907246-5650-9-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-9-git-send-email-mroth@nessie.de>
Message-ID: <20091007115514.4d9f36c7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:31 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> Tested with 4.5.2.

Are you sure about this ? This workaround was added in April 2009, when
the Qt version we packaged was 4.5.0. Was it fixed in the mean time ?

Did you try a configuration with an x86/uClibc toolchain on an x86
host ? I also remember from confusions between the mkspecs file to be
used for compiling host tools and target tools/libraries.

Note: I'm absolutely unsure whether the workaround is needed. I'm just
asking for simple clarifications, not trying to be offensive in anyway.
I really do appreciate the work you did to clean-up the Qt packaging.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
