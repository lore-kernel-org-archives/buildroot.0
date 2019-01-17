From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 09:56:35 +0100
Subject: [Buildroot] [PATCH] package/gst1-plugins-bad: fix build with
 fdk-aac 2.0
In-Reply-To: <20190116214849.13417-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 16 Jan 2019 22:48:49 +0100")
References: <20190116214849.13417-1-peter@korsgaard.com>
Message-ID: <87k1j38xx8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/343/343249ab34ab77be3b8077f544b9d1e2d4852796/
 > http://autobuild.buildroot.net/results/edc/edca961f2c4d1946385ac86a756308caaf22d79d/

 > Fdk-aac 2.0 dropped some legacy APIs, breaking the build of the fdk-aac
 > plugin.  Add two upstream upstream patches to fix building against fdk-aac
 > 2.0.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed after fixing the missing signed-off-by, thanks.

-- 
Bye, Peter Korsgaard
