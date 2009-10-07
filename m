From: Michael Roth <mroth@nessie.de>
Date: Wed, 7 Oct 2009 12:30:43 +0200
Subject: [Buildroot] [PATCH 12/23] qt: respect silent mode instead non
	existing verbose mode
In-Reply-To: <20091007115741.4f5e44df@surf>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-13-git-send-email-mroth@nessie.de>
	<20091007115741.4f5e44df@surf>
Message-ID: <200910071230.48080.mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wednesday 07 October 2009 11:57:41 schrieb Thomas Petazzoni:
> I'm not sure about this one. In the main Makefile, we definitely define
> VERBOSE, but not QUIET.

Commit 89464a96015e89da07b87d18b31f4b25b4c890ba introduced QUIET.

But you're right. I overlooked VERBOSE. Maybe this should be split
into two ifs?


Michael Roth
