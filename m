From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 22:41:49 +0100
Subject: [Buildroot] [PATCH] lttng-tools: fix build with gcc 5.x
In-Reply-To: <1448471703-5457-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 25 Nov 2015 18:15:03 +0100")
References: <1448471703-5457-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878u5lzrhe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit backports an upstream commit from lttng-tools to solve gcc
 > 5.x related build issues.

 > Fixes:

 >   http://autobuild.buildroot.org/results/65e/65e0fbddfee14aff84a4ca59cd7315e1e250b55b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
