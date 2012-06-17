From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Jun 2012 11:09:43 +0200
Subject: [Buildroot] [PATCH] ffmpeg: bump to 0.11.1
In-Reply-To: <4FDB2E46.8090705@elvees.com> (Anton Leontiev's message of "Fri, 
 15 Jun 2012 16:44:54 +0400")
References: <4FDB2E46.8090705@elvees.com>
Message-ID: <871ulegv8o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Leontiev <aleontiev@elvees.com> writes:

 Anton> Signed-off-by: Anton Leontiev <aleontiev@elvees.com>

Thanks, but I cannot commit it as it is now. First of all, Thunderbird
had corrupted your patch by word wrapping and stripping trailing
spaces. Please use git send-email and/or test patches by sending them to
yourself and see if they still applies for next time.

Secondly, we have a number of other packages using ffmpeg, and the 0.11
version seems to change the APi in a number of ways. From a quick build
test I see that:

- gst-ffmpeg
- mediastreamer
- opencv

Are broken, so those packages would need to be upgraded / fixed before.

-- 
Bye, Peter Korsgaard
