From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 12:12:10 +0200
Subject: [Buildroot] [PATCH 1/1] dbus: pthread static lib
In-Reply-To: <5250A34B.3060903@openwide.fr> (Romain Naour's message of "Sun,
 06 Oct 2013 01:39:55 +0200")
References: <5250A34B.3060903@openwide.fr>
Message-ID: <871u3yhfnp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 Romain> -lpthread is missing when dbus is build with static lib
 Romain> fix build failure:
 Romain> http://autobuild.buildroot.net/results/80a317e33afd1d5ba2f7dd9ecd89314b09b4b1fe/
 Romain> http://autobuild.buildroot.net/results/2c3c040624652547bbeec363d7d6b03f2477ff00/

Thanks. You forgot your Signed-off-by tag. Can I add it?

-- 
Bye, Peter Korsgaard
