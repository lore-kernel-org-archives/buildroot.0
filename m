From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Sep 2011 23:23:54 +0200
Subject: [Buildroot] [PATCH 2/2] fs/initramfs: refactor with fs/cpio
In-Reply-To: <1315343769-530-2-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 6 Sep 2011 23:16:09 +0200")
References: <1315343769-530-1-git-send-email-arnout@mind.be>
 <1315343769-530-2-git-send-email-arnout@mind.be>
Message-ID: <87k48tvfv9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> An initramfs is in fact the same as a cpio archive, but embedded in
 Arnout> the kernel.  So instead of duplicating the cpio infrastructure,
 Arnout> we can simply build images/rootfs.cpio and link that into the
 Arnout> kernel.

Committed, thanks.

-- 
Bye, Peter Korsgaard
