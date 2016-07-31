From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 22:23:33 +0200
Subject: [Buildroot] [PATCH] strace: bump to version 4.13
In-Reply-To: <9bc291044351bf19b1cd7d4af632ab9ac8c5126f.1469990671.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 31 Jul 2016 21:44:31 +0300")
References: <9bc291044351bf19b1cd7d4af632ab9ac8c5126f.1469990671.git.baruch@tkos.co.il>
Message-ID: <87r3a9r1yy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop upstream patch.
 > Remove preseed of netlink.h and if_packet.h tests since these tests were
 > removed from configure.ac.

 > Add stronger sha256 hash.

 > Version 4.13 fixes a typo in configure.ac (commit 7c0e8875a432) that causes
 > build failure with kernel v4.7 headers, thus fixing:
 > http://autobuild.buildroot.net/results/aa6/aa6badae8b3d58d6d48161f261988103271bc2ef/
 > http://autobuild.buildroot.net/results/4ad/4ad1b0c42206243bd76e94b34454d4108fb31070/
 > http://autobuild.buildroot.net/results/1c6/1c6c88a7163529a666d1661969736f66e9aba7f7/

 > and more.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
