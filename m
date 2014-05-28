From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 May 2014 10:02:27 +0200
Subject: [Buildroot] [PATCH v2] dropbear: fix missing directory with
	systemd
In-Reply-To: <1401263180-30574-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Wed, 28 May 2014 09:46:20 +0200")
References: <1401263180-30574-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87bnuicovg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > The current SysV startup script create a directory which is necessary
 > for dropbear to correctly work.
 > This creation is not done with systemd.

 > Instead of both init creating the directory, we add the creation of this
 > directory to the INSTALL_TARGET_CMDS to make sure it's present.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed with the TARGET_DIR reference fixed as pointed out by Thomas,
thanks.

-- 
Bye, Peter Korsgaard
