From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:16:24 +0200
Subject: [Buildroot] [PATCH] skalibs: fix endianness detection on x86
In-Reply-To: <20170320201122.26539-1-eric.le.bihan.dev@free.fr> (Eric Le
 Bihan's message of "Mon, 20 Mar 2017 21:11:22 +0100")
References: <20170320201122.26539-1-eric.le.bihan.dev@free.fr>
Message-ID: <877f362yx3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > Update the patch for compile time endianness detection so it works on
 > x86 platforms using GCC <= 4.4.

 > Fixes:

 >   http://autobuild.buildroot.net/results/c2e8e1180571976b412cbba729c45a3698aea0b2
 >   http://autobuild.buildroot.net/results/2ee47107d8a67470f7bc3e10cf763202d5455d17

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
