From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Mar 2018 16:03:58 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-cmake: enable toolchain install
 staging phase
In-Reply-To: <20180326120043.25160-1-chemobejk@gmail.com> (Stefan Becker's
 message of "Mon, 26 Mar 2018 15:00:43 +0300")
References: <20180326120043.25160-1-chemobejk@gmail.com>
Message-ID: <87zi2vszld.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Becker <chemobejk@gmail.com> writes:

 > Really fix commit 6729050f3a49dba42d2d881d31dbefd6b82b8dad
 > That commit added a script to "toolchain" post install staging hooks.
 > This will only be executed if TOOLCHAIN_INSTALL_STAGING is set to YES.

 > Signed-off-by: Stefan Becker <chemobejk@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
