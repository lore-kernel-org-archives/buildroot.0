From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 20:05:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: set GOCACHE to a host path
In-Reply-To: <20190312054114.21361-1-christian@paral.in> (Christian Stewart's
 message of "Mon, 11 Mar 2019 22:41:14 -0700")
References: <20190312054114.21361-1-christian@paral.in>
Message-ID: <87mulilqpd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Set the GOCACHE environment variable properly.
 > It was previously unset, and defaults to $HOME/.cache/go-build.

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
