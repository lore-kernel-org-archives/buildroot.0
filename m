From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 14:57:50 +0200
Subject: [Buildroot] [PATCH 1/1] linux-fusion: fix a build issue
In-Reply-To: <20170704184157.66a438eb@windsurf> (Thomas Petazzoni's message of
 "Tue, 4 Jul 2017 18:41:57 +0200")
References: <20170704031238.14389-1-matthew.shyu.amlogic@gmail.com>
 <20170704184157.66a438eb@windsurf>
Message-ID: <87lgnkbn3l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue,  4 Jul 2017 11:12:38 +0800, Matthew Shyu wrote:
 >> From: Matthew Shyu <matthew.shyu@amlogic.com>
 >> 
 >> size parameter from sock_recvmsg was removed from kernel API since 4.7
 >> 
 >> Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
 >> ---
 >> .../0004-Port-one-one_udp.c-to-Linux-4.1.patch     | 27 ++++++++++++++++++----
 >> 1 file changed, 23 insertions(+), 4 deletions(-)

 > Thanks, I've applied your patch to the master branch, after improving a
 > bit the commit title and commit log.

 > It's by the way surprising that people are still using DirectFB, even
 > though the project has been dead for several years.

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
