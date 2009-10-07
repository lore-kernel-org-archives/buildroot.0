From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 11:57:41 +0200
Subject: [Buildroot] [PATCH 12/23] qt: respect silent mode instead non
 existing verbose mode
In-Reply-To: <1254907246-5650-13-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-13-git-send-email-mroth@nessie.de>
Message-ID: <20091007115741.4f5e44df@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:35 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

I'm not sure about this one. In the main Makefile, we definitely define
VERBOSE, but not QUIET.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
