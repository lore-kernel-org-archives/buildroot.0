From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Jun 2013 22:32:29 +0200
Subject: [Buildroot] [PATCH] usbmount: stop using blkid,
	use udev environment variables instead
In-Reply-To: <1371657388-11563-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Wed, 19 Jun 2013 17:56:28 +0200")
References: <20130619164656.33bc3f8c@skate>
 <1371657388-11563-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87r4fxq1sy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> The blkid binary is not any longer installed when libblkid from
 Sven> util-linux is selected. udev has a builtin blkid command though
 Sven> and already detects all values that we are interested in. Change
 Sven> the usbmount script to use the environment variables set by udev
 Sven> instead of calling blkid directly.

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>

Committed, thanks. Please don't forget to send the patch upstream as
well.

-- 
Bye, Peter Korsgaard
