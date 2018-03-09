From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Mar 2018 22:25:06 +0100
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.15.1
In-Reply-To: <523c80cff000a6c35a19922e22239e0490ce6a85.1520579520.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 9 Mar 2018 09:12:00 +0200")
References: <523c80cff000a6c35a19922e22239e0490ce6a85.1520579520.git.baruch@tkos.co.il>
Message-ID: <87d10dhrgt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Disable libzstd support explicitly to avoid configure failure. The
 > Buildroot zstd package does not currently install its library.

 > Drop upstream patch.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
