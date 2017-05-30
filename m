From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 May 2017 09:14:02 +0200
Subject: [Buildroot] [PATCH 1/1] docker-engine: fix journald logging
	driver
In-Reply-To: <20170530035004.28855-1-christian@paral.in> (Christian Stewart's
 message of "Mon, 29 May 2017 20:50:04 -0700")
References: <20170530035004.28855-1-christian@paral.in>
Message-ID: <87inkiakat.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > The Docker engine can optionally log to systemd-journald. For this
 > driver to work correctly, Docker needs to build against
 > systemd-journald's client library.

 > This patch conditionally adds a build-time dependency on systemd and
 > enables compiling the journald driver in docker-engine if systemd is
 > used as the Buildroot init process.

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
