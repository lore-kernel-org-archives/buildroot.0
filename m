From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:29:14 +0100
Subject: [Buildroot] [PATCH] pulseaudio: remove the ConsoleKit module
In-Reply-To: <b7568fe9d9659520356ec09c58908edd27656a03.1513696352.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 19 Dec 2017 17:12:32 +0200")
References: <b7568fe9d9659520356ec09c58908edd27656a03.1513696352.git.baruch@tkos.co.il>
Message-ID: <87tvwboldx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The ConsoleKit module is loaded by default from the default.pa
 > configuration file, but its initialization fails because Buildroot has
 > no ConsoleKit package yet. This breaks per-user pulseaudio daemon.
 > The default.pa configuration load module-console-kit only when it
 > exists. Remove module-console-kit to fix pulseaudio per-user startup.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
