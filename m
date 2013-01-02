From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jan 2013 21:02:59 +0100
Subject: [Buildroot] [PATCH 01/20] xapp_xinput-calibrator: rename
	directory to match .mk name
In-Reply-To: <cdd5556b67ab27d5e33b73f3c487add506513a8b.1357125961.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 2 Jan 2013 12:26:36 +0100")
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <cdd5556b67ab27d5e33b73f3c487add506513a8b.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pq1npd3g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The directory was named xapp_xinput_calibrator, but the .mk file was
 Thomas> named xapp_xinput-calibrator.mk, which isn't consistent. Rename the
 Thomas> directory to xapp_xinput-calibrator to be consistent with the naming
 Thomas> of the .mk file and the other x11r7 directories.

Committed, thanks.

-- 
Bye, Peter Korsgaard
