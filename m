From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:05:27 +0100
Subject: [Buildroot] [PATCH 1/1] go: security bump to 1.11.5
In-Reply-To: <20190124081633.16600-1-christian@paral.in> (Christian Stewart's
 message of "Thu, 24 Jan 2019 00:16:33 -0800")
References: <20190124081633.16600-1-christian@paral.in>
Message-ID: <87imy741k8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Go 1.11.5 addresses a reported security issue, CVE-2019-6486.
 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2018.11.x, thanks.

We use go 1.9.7 on the 2018.02.x branch. It is not really clear to me if
1.9.x is also affected?

-- 
Bye, Peter Korsgaard
