From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 21:54:48 +0200
Subject: [Buildroot] [PATCH] package/micropython: Define
 MICROPY_NLR_SETJMP for xtensa
In-Reply-To: <20210329072828.13989-1-judge.packham@gmail.com> (Chris Packham's
 message of "Mon, 29 Mar 2021 20:28:28 +1300")
References: <20210329072828.13989-1-judge.packham@gmail.com>
Message-ID: <87ft05ygdz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 > As suggested on https://github.com/micropython/micropython/issues/6551
 > define MICROPY_NLR_SETJMP to avoid the xtensa specific implementation
 > of nlr_push.

 > Fixes:
 > - http://autobuild.buildroot.net/results/5fc8669b5c768ccfc02bd20d1159bce7fe43683e

 > Signed-off-by: Chris Packham <judge.packham@gmail.com>

Committed to 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
