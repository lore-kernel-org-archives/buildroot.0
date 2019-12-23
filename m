From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:10:17 +0100
Subject: [Buildroot] [PATCH] package/syslog-ng: remove bogus select
In-Reply-To: <20191213152154.1372083-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 13 Dec 2019 16:21:54 +0100")
References: <20191213152154.1372083-1-thomas.petazzoni@bootlin.com>
Message-ID: <87o8vzwjh2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The eventlog package was removed as part of commit
 > 5e0b1f9c2386e9184256b10ca19a6a7e4f4865cc ("package/eventlog: remove
 > package"). It used to be a separate package, but it is now part of
 > syslog-ng itself, which is why the eventlog package was removed.

 > But commit 5e0b1f9c2386e9184256b10ca19a6a7e4f4865cc forgot to drop the
 > select BR2_PACKAGE_EVENTLOG, so let's fix this.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
