From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Sep 2011 23:23:42 +0200
Subject: [Buildroot] [PATCH 1/2] cpio: fix boot with dynamic /dev
In-Reply-To: <1315343769-530-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 6 Sep 2011 23:16:08 +0200")
References: <1315343769-530-1-git-send-email-arnout@mind.be>
Message-ID: <87oby5vfvl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

 Arnout> Devtmpfs doesn't get automounted by the kernel when an
 Arnout> initramfs is used.  Since cpio archives are used almost
 Arnout> exclusively as an initramfs, the same fix should be applied to
 Arnout> it as for the initramfs.

Committed, thanks.

-- 
Bye, Peter Korsgaard
