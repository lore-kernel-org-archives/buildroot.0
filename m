From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jan 2017 13:57:13 +0100
Subject: [Buildroot] [PATCH] xorg-server: not available with musl on ARM
In-Reply-To: <20170120152601.30220-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 20 Jan 2017 16:26:01 +0100")
References: <20170120152601.30220-1-peter@korsgaard.com>
Message-ID: <8737gcr2om.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes #9606
 > xserver uses inb/outb on arm, which aren't available with musl.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
