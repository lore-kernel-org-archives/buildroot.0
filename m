From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Sep 2013 10:56:00 +0200
Subject: [Buildroot] latest kmod is broken
In-Reply-To: <B02044171A0C408F90D8A034B3523859@JohanW7> (Sagaert Johan's
 message of "Wed, 4 Sep 2013 10:22:05 +0200")
References: <B02044171A0C408F90D8A034B3523859@JohanW7>
Message-ID: <874na155jz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi 
 Sagaert> Using current git version

 Sagaert> It seems to try making 'host-busybox'

Ahh yes. It only happens if you have BR2_PACKAGE_KMOD_TOOLS enabled,
which is why I didn't notice it while testing.

Fixed in git, thanks.

-- 
Bye, Peter Korsgaard
