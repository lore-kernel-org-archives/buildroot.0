From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 16:04:47 +0100
Subject: [Buildroot] [PATCH] package/busybox: fix individual binaries
 installation
In-Reply-To: <20200223105912.1158-1-unixmania@gmail.com> (unixmania's message
 of "Sun, 23 Feb 2020 07:59:12 -0300")
References: <20200223105912.1158-1-unixmania@gmail.com>
Message-ID: <87r1xvvuy8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Call BUSYBOX_INSTALL_INDIVIDUAL_BINARIES in BUSYBOX_INSTALL_TARGET_CMDS,
 > not in BUSYBOX_INSTALL_INIT_SYSV. This should have been done in commit
 > b1e07d6d796e67a980d4a05d04c64f00162245ff but was somehow lost during the
 > review/aply process.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
