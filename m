From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jun 2018 23:26:47 +0200
Subject: [Buildroot] [PATCH] wireguard: bump version to 0.0.20180613
In-Reply-To: <20180620130806.19229-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 20 Jun 2018 15:08:06 +0200")
References: <20180620130806.19229-1-peter@korsgaard.com>
Message-ID: <87a7rpm9ns.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Contains a fix for a crash when forwarding packets from devices that use
 > flow offloading and a x86 FPU issue on -rt kernels.

 > Also add a post-release upstream patch fixing a compilation issue related to
 > memcpy().

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
