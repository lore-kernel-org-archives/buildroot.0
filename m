From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Oct 2017 14:30:03 +0200
Subject: [Buildroot] [PATCH] nfs-utils: add missing include of stdint
In-Reply-To: <1506958689-1289-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Mon, 2 Oct 2017 10:38:09 -0500")
References: <1506958689-1289-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87lgksbeic.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Glibc bump to 2.26 exposed this missing header when building
 > with the following combination using an i386 internal toolchain.
 > gcc5.4.0
 > bin2.28.1
 > linux4.1.43

 > Logfile snippet:

 > 2017-10-02T00:08:11 ^
 > 2017-10-02T00:08:12 rpc.c: In function ?nsm_recv_getport?:
 > 2017-10-02T00:08:12 rpc.c:469:13: error: ?UINT16_MAX? undeclared (first use in this function)

 > Upstream: https://bugzilla.linux-nfs.org/show_bug.cgi?id=312

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
