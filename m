From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:06:28 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: rename
	patch directory after the last version bump
In-Reply-To: <20171007130156.17309-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 7 Oct 2017 15:01:56 +0200")
References: <20171007130156.17309-1-romain.naour@gmail.com>
Message-ID: <871sm2jg8b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The last bump [1] forgot to rename the patch directory and remove
 > upstream patches.

 > We still need to fix the monotonic clock check which doesn't work
 > when cross-compiling.

 > [1] 436659c55f8d3c6155546cfc666a13c793d992f9

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
