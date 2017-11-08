From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Nov 2017 13:25:17 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: bump version to 8.9.1
In-Reply-To: <20171108112542.8163-1-martin@barkynet.com> (Martin Bark's
 message of "Wed, 8 Nov 2017 11:25:41 +0000")
References: <20171108112542.8163-1-martin@barkynet.com>
Message-ID: <87vailez4i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > See https://nodejs.org/en/blog/release/v8.9.1/
 > Signed-off-by: Martin Bark <martin@barkynet.com>

Are these meant for master or next? The nodejs bump looks like master
material to me, but what about libuv? Does the new nodejs version depend
on the libuv bump?

-- 
Bye, Peter Korsgaard
