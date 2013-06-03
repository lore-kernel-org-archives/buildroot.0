From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Jun 2013 23:09:13 +0200
Subject: [Buildroot] [PATCH 2/6] package/linux-firmware: bump version
	for new firmware
In-Reply-To: <97ba0d959c1ec97eea764c84f57d1e2d5e99bff4.1370289131.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 3 Jun 2013 22:15:48 +0200")
References: <cover.1370289131.git.yann.morin.1998@free.fr>
 <cover.1370289131.git.yann.morin.1998@free.fr>
 <97ba0d959c1ec97eea764c84f57d1e2d5e99bff4.1370289131.git.yann.morin.1998@free.fr>
Message-ID: <87ehcihpfq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Bump version to get a few new firmware files for some WiFi adapters.

 Yann> In the rtl81xx familly, it's hard to differentiate each members: I have
 Yann> a USB stick that identifies itself as TRL8188CUS, but is handled by the
 Yann> rtl8192ce driver. So I moved all of rtl81xx firmwares under the same
 Yann> option to avoid confusion.

 Yann> It will be the responsibility of the user to eventually get rid of
 Yann> unwanted firmware files in a post-build script, if needed.

 Yann> Ditto for rtl87xx.

Committed, thanks.

-- 
Bye, Peter Korsgaard
