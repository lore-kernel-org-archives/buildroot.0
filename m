From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 21:27:06 +0100
Subject: [Buildroot] [PATCH 4/4] docker-engine: fix runc version check
 warning
In-Reply-To: <20190212093531.13145-4-christian@paral.in> (Christian Stewart's
 message of "Tue, 12 Feb 2019 01:35:31 -0800")
References: <20190212093531.13145-1-christian@paral.in>
 <20190212093531.13145-4-christian@paral.in>
Message-ID: <87zhr0sqg5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Fixes the startup warning from Docker:
 > failed to retrieve runc version: unknown output format: runc version commit ...

 > Introduces a patch to replace the faulty version detection logic in the Docker
 > engine.

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed, thanks.

Please submit the patch upstream.

-- 
Bye, Peter Korsgaard
