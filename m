From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:14:21 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsock: Fix openssl reporting in
 header
In-Reply-To: <1548448504-49177-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 (Clayton Shotwell's message of "Fri, 25 Jan 2019 14:35:04 -0600")
References: <1548448504-49177-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <87ef8v415e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Clayton" == Clayton Shotwell <clayton.shotwell@rockwellcollins.com> writes:

 > The websock_config.h file currently ends up being installed into the
 > sysroot with a #include "config.h" line but the config.h file does not
 > get copied into the sysroot. Refactoring the original patch to have the
 > configure script properly report whether or not SSL support is enabled
 > without using the config.h file.

 > Patch has been submitted upstream but may never be merged.
 > https://github.com/payden/libwebsock/pull/38

 > Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
