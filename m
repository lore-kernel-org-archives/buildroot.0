From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Nov 2011 20:55:17 +0100
Subject: [Buildroot] [PATCH] clean-for-rebuild: also remove
	images_installed stamp
In-Reply-To: <1321378277-5625-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 15 Nov 2011 17:31:17 +0000")
References: <1321378277-5625-1-git-send-email-arnout@mind.be>
Message-ID: <871ut9ma8q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Without this, a linux-rebuild or bootloader-rebuild will not install
 Arnout> the rebuilt image in the images directory.

Committed, thanks.

-- 
Bye, Peter Korsgaard
