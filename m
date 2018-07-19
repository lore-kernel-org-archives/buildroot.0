From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 20:09:07 +0200
Subject: [Buildroot] [RFC] lm-sensors: fix static build
In-Reply-To: <20180705091630.52590f91@windsurf> (Thomas Petazzoni's message of
 "Thu, 5 Jul 2018 09:16:30 +0200")
References: <4c4c3f8770727f91fb173fbc077dd8b7c15cc216.1520531013.git.baruch@tkos.co.il>
 <20180705091630.52590f91@windsurf>
Message-ID: <87in5bcd30.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Thu,  8 Mar 2018 19:43:33 +0200, Baruch Siach wrote:
 >> Add -static to the link command line to have libgcc resolve libc
 >> symbols. This overrides the default -Wl,-rpath,/usr/lib, which is
 >> useless for static build anyway.
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/25d/25d580bee6f609f6b28ebd6cc96d180179901b0e/
 >> 
 >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 >> ---

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
