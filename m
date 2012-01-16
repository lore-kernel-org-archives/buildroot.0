From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jan 2012 16:28:10 +0100
Subject: [Buildroot] Error building for ARM Cortex A8 - "For cortex-a8
	real value is cortexa8"
In-Reply-To: <CAOh8SabFka2WK=WK0Uu2KRFw1kfkfBsXKMxWTFXLRwEdC3bnKg@mail.gmail.com>
 (Alireza Nematollahi's message of "Wed, 7 Dec 2011 21:15:27 -0800")
References: <CAOh8SabFka2WK=WK0Uu2KRFw1kfkfBsXKMxWTFXLRwEdC3bnKg@mail.gmail.com>
Message-ID: <87d3ajd5v9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alireza" == Alireza Nematollahi <alirezan1@gmail.com> writes:

 Alireza> Hello
 Alireza> I am trying to build "buildroot" on CentOS 6 64 bit for my ARM Cortex A8
 Alireza> target. I have gcc/g++ 4.2. In the settings for buildroot the only one I change
 Alireza> is the target type, arm and arm cortex a8. I left everything else untouched to
 Alireza> build a default copy.

Like the comment in make menuconfig says, cortex A8 is only supported
from GCC 4.4 onwards.

-- 
Bye, Peter Korsgaard
