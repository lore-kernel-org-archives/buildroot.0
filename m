From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Jan 2019 00:51:59 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsock: Fix openssl reporting in
 header
In-Reply-To: <1548448504-49177-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1548448504-49177-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <26656678-7bad-04f0-a3fe-183b8fd9bce5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/01/2019 21:35, Clayton Shotwell wrote:
> The websock_config.h file currently ends up being installed into the
> sysroot with a #include "config.h" line but the config.h file does not
> get copied into the sysroot. Refactoring the original patch to have the
> configure script properly report whether or not SSL support is enabled
> without using the config.h file.
> 
> Patch has been submitted upstream but may never be merged.
> https://github.com/payden/libwebsock/pull/38
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

 Applied to master, thanks.

 Regards,
 Arnout
