From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Mar 2018 09:07:35 +0100
Subject: [Buildroot] [PATCH v2 1/1] fbgrab: add patch fixing pixel
 format report
In-Reply-To: <1520493725-1146-1-git-send-email-timo.ketola@exertus.fi> (Timo
 Ketola's message of "Thu, 8 Mar 2018 09:22:05 +0200")
References: <1520493725-1146-1-git-send-email-timo.ketola@exertus.fi>
Message-ID: <87muzjj8hk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Timo" == Timo Ketola <timo.ketola@exertus.fi> writes:

 > When verbosive, fbgrab reports pixel format. Green and blue offset and
 > msb_right fields are accidentally swapped there. This commit adds a patch
 > which straightens them up.

 > Upstream-Status: Submitted [Gunnar Monell <gmo@linux.nu>]

 > Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
 > ---
 > No changes in the payload. Only added Upstream-status (Adrian) and
 > adjusted subject line (Thomas).

Committed, thanks.

-- 
Bye, Peter Korsgaard
