From: Michael Roth <mroth@nessie.de>
Date: Wed, 7 Oct 2009 12:32:30 +0200
Subject: [Buildroot] [PATCH 14/23] qt: make the output of sed hacks much
	more human readable
In-Reply-To: <20091007115941.54d4089f@surf>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-15-git-send-email-mroth@nessie.de>
	<20091007115941.54d4089f@surf>
Message-ID: <200910071232.35399.mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wednesday 07 October 2009 11:59:41 schrieb Thomas Petazzoni:
>  2. You should probably use $(Q) instead of @ on the $(SED) lines so
>     that the user doing "make V=1" will still get the real command lines

Yes, I will change this. Thanks.


Michael Roth
