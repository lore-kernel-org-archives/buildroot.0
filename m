From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 11:02:24 +0200
Subject: [Buildroot] [PATCH 1/1] go: bump to 1.10
In-Reply-To: <20180219072718.28895-1-christian@paral.in> (Christian Stewart's
 message of "Mon, 19 Feb 2018 02:27:18 -0500")
References: <20180219072718.28895-1-christian@paral.in>
Message-ID: <87po3js3j3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > This commit bumps the Go programming language to the 1.10 release.
 > Signed-off-by: Christian Stewart <christian@paral.in>

This causes a number of build issues (strangely enough only from March
13th). Care to take a look?

http://autobuild.buildroot.net/?reason=host-go-1.1

-- 
Bye, Peter Korsgaard
