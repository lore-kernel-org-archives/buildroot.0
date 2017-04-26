From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:13:33 +0200
Subject: [Buildroot] [PATCH] package/xenomai: fallback to http
In-Reply-To: <20170425212612.4612-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 25 Apr 2017 23:26:12 +0200")
References: <20170425212612.4612-1-romain.naour@gmail.com>
Message-ID: <878tmnod42.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The https protocol return:
 > "ERROR 503: Service Temporarily Unavailable"

 > Fixes:
 > http://autobuild.buildroot.net/results/120/12034603c46c8bd69590c88bbfe85261460b699c

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
