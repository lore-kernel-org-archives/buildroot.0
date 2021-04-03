From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 11:12:03 +0200
Subject: [Buildroot] [PATCH] board/beaglebone: remove
 genimage_linux41.cfg
In-Reply-To: <20210322152925.3218412-1-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Mon, 22 Mar 2021 16:29:17 +0100")
References: <20210322152925.3218412-1-buildroot@heine.tech>
Message-ID: <87y2dz7mvw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@busybox.net> writes:

 > Commit 5502a889dd9f065ec4694a993cfa509377da2cce
 > ("configs/beaglebone_qt5: don't use custom post-image script") removed the use
 > of genimage_linux41.cfg but didn't remove the file.

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
