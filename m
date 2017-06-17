From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Jun 2017 10:48:31 +0200
Subject: [Buildroot] [PATCH 1/2] openblocks_a6_defconfig: bump to
	linux-4.11.5 to fix build with gcc 6
In-Reply-To: <20170616144144.30280-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 16 Jun 2017 16:41:43 +0200")
References: <20170616144144.30280-1-peter@korsgaard.com>
Message-ID: <87shizgfts.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The recent change to default to gcc 6 for the internal toolchain broke this
 > defconfig, as the kernel doesn't contain commit cb984d101b (compiler-gcc:
 > integrate the various compiler-gcc[345].h files) which added during the 4.2

s/which added/which was added/.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
