From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Nov 2017 19:46:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: bump version to 8.9.1
In-Reply-To: <CAFGQKxf6E4Zk_rbYaJweQ8YOo5_ioc6=4b2yeNvXr_1AHVN6BA@mail.gmail.com>
 (Martin Bark's message of "Wed, 8 Nov 2017 15:55:14 +0000")
References: <20171108112542.8163-1-martin@barkynet.com>
 <87vailez4i.fsf@dell.be.48ers.dk>
 <CAFGQKxf6E4Zk_rbYaJweQ8YOo5_ioc6=4b2yeNvXr_1AHVN6BA@mail.gmail.com>
Message-ID: <87y3ngehhv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > Hi,
 > On 8 November 2017 at 12:25, Peter Korsgaard <peter@korsgaard.com> wrote:
 >>>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
 >> 
 >> > See https://nodejs.org/en/blog/release/v8.9.1/
 >> > Signed-off-by: Martin Bark <martin@barkynet.com>
 >> 
 >> Are these meant for master or next? The nodejs bump looks like master
 >> material to me, but what about libuv? Does the new nodejs version depend
 >> on the libuv bump?

 > I would prefer master but if you can't because of the 2017.11 release
 > then i'm fine with next.

 > Yes the nodejs version needs the libuv bump.  nodejs 8.9.1 includes a
 > cherry picked patch from libuv which is present in the 1.16.0 release.

Ok - Committed both to master then, thanks.

-- 
Bye, Peter Korsgaard
