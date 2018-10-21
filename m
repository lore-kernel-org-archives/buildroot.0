From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 09:01:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/mjpg-streamer: needs headers >=
 3.16
In-Reply-To: <20181020214720.18993-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 20 Oct 2018 23:47:20 +0200")
References: <20181020214720.18993-1-bernd.kuhls@t-online.de>
Message-ID: <87a7n7940t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Upstream commit
 > https://github.com/jacksonliam/mjpg-streamer/commit/29fb2b9a65630721c539a216225288fba9497c49#diff-fc82978386df1046ac9aac8cbe0a129eR825

 > added the usage of V4L2_EVENT_SOURCE_CHANGE which was added to kernel
 > version 3.16 with commit "[media] v4l: Add source change event":
 > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/include/uapi/linux/videodev2.h?id=3cbe6e5bcad0b102c06b9c6029fda75630045475

 > To compare:
 > - linux 3.15 without the commit:
 >   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/include/uapi/linux/videodev2.h?h=linux-3.15.y
 > - linux 3.16 is the first kernel with the commit:
 >   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/include/uapi/linux/videodev2.h?h=linux-3.16.y

 > Fixes
 > http://autobuild.buildroot.net/results/4f8/4f8dc7520ee692c665167fda69dc3af66263008f/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
