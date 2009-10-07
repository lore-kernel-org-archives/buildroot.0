From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 13:02:06 +0200
Subject: [Buildroot] [PATCH 12/23] qt: respect silent mode instead non
 existing verbose mode
In-Reply-To: <200910071230.48080.mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-13-git-send-email-mroth@nessie.de>
	<20091007115741.4f5e44df@surf> <200910071230.48080.mroth@nessie.de>
Message-ID: <20091007130206.1a6f9821@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 7 Oct 2009 12:30:43 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> Commit 89464a96015e89da07b87d18b31f4b25b4c890ba introduced QUIET.

Hum correct. My tree was in branch not rebased against the very latest
Buildroot git.

> But you're right. I overlooked VERBOSE. Maybe this should be split
> into two ifs?

I think we should make a formal decision on the respective semantic of
VERBOSE and QUIET, because the difference between these two variables
is not clear to me.

Peter ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
