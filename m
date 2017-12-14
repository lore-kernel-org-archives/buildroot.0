From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Dec 2017 22:41:49 +0100
Subject: [Buildroot] [PATCH] linux-tools: add usbip (USB/IP userspace
 tools)
In-Reply-To: <20171214095614.5e99e0a0@windsurf.png.is.keysight.com> (Thomas
 Petazzoni's message of "Thu, 14 Dec 2017 09:56:14 +0100")
References: <1512566955-4712-1-git-send-email-julien.boibessot@free.fr>
 <20171214095614.5e99e0a0@windsurf.png.is.keysight.com>
Message-ID: <878te52dia.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> sourcery-arm-armv4t [40/47]: SKIPPED
 >> sourcery-arm [41/47]: SKIPPED
 >> sourcery-arm-thumb2 [42/47]: SKIPPED
 >> sourcery-mips64 [43/47]: OK
 >> sourcery-mips [44/47]: OK
 >> sourcery-nios2 [45/47]: OK
 >> sourcery-x86-64 [46/47]: OK
 >> x86_64-ctng_locales-linux-gnu [47/47]: SKIPPED
 >> 47 builds, 19 skipped, 0 build failed, 0 legal-info failed

 > Does it makes sense to include the test-pkg details in the commit log?
 > This is a real open question. We don't do it today, but I might see
 > some value in having it. What do others think ?

I think it does. It is useful information and if it is in the commit
message then it is easy to find back.

-- 
Bye, Peter Korsgaard
