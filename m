From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:20:56 +0200
Subject: [Buildroot] [PATCH] package/flare-engine: fix check-package
 failure
In-Reply-To: <20190529183233.3544-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Wed, 29 May 2019 20:32:33 +0200")
References: <20190529183233.3544-1-giulio.benetti@micronovasrl.com>
Message-ID: <877e9yivtz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > Check-package gives error on flare-engine due to trailing whitespace in
 > flare-engine.mk comment inserted with commit:
 > https://git.buildroot.net/buildroot/commit/?id=1203cca1b51eefb4ee236d998ab6ec32bdd087d8

 > Remove trailing whitespace in flare-engine.mk comment.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
