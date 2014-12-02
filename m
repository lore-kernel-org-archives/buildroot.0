From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 12:59:05 +0100
Subject: [Buildroot] [PATCH] live555: fix shared library build on x86
In-Reply-To: <bb64ba65fded8d92e398aa63b022707ae673782d.1417506520.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 2 Dec 2014 09:48:41 +0200")
References: <bb64ba65fded8d92e398aa63b022707ae673782d.1417506520.git.baruch@tkos.co.il>
Message-ID: <87y4qq1cvq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > -fPIC is required for shared libraries on x86.
 > Fixes:
 > http://autobuild.buildroot.net/results/6e7/6e78d3e29856c25d233f1629c31bc15f7ecb2f89/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
