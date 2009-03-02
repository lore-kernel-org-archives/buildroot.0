From: James Chapman <jchapman@katalix.com>
Date: Mon, 02 Mar 2009 22:27:25 +0000
Subject: [Buildroot] MIPS arch on NPTL branch
Message-ID: <49AC5D4D.3030600@katalix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just wondering what the status of the MIPS arch is on the uclibc-NPTL
branch tip.  I'm seeing compile errors because _dl_find_hash() now has
an extra argument. Is MIPS missing an update after generic ldso changes?
Perhaps someone is already working on this?

-- 
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development
