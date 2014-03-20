From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Mar 2014 16:47:34 +0100
Subject: [Buildroot] [PATCH 1/1] Fix microblize little endian toolchain
In-Reply-To: <1395230465-4421-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 (Jan Viktorin's message of "Wed, 19 Mar 2014 13:01:05 +0100")
References: <1395230465-4421-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <877g7ox46h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Viktorin <xvikto03@stud.fit.vutbr.cz> writes:

 > From: Jan Drazil <xdrazi00@stud.fit.vutbr.cz>
 > Buildroot toolchain creates big endian binaries instead of little endian
 > ones for microblaze architecture. The reason is wrong BR2_ARCH string.
 > KERNEL_ARCH must contain microblaze in both cases.

Committed, thanks.

-- 
Bye, Peter Korsgaard
