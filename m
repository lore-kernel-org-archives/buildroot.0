From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Nov 2019 15:46:56 +0100
Subject: [Buildroot] [PATCH] package/linux-serial-test: bump version
In-Reply-To: <20191106135222.26085-1-yegorslists@googlemail.com>
 (yegorslists's message of "Wed, 6 Nov 2019 14:52:22 +0100")
References: <20191106135222.26085-1-yegorslists@googlemail.com>
Message-ID: <878sotdpun.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > The latest version specifies the CMake project type as C-only.
 > Otherwise the build will fail for configurations without C++ compiler.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Given the fixes and the fact tht linux-serial-test is so new -
Committed to master, thanks.

-- 
Bye, Peter Korsgaard
