From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 May 2012 17:39:36 +0200
Subject: [Buildroot] [PATCH 1/1] libfcgi: fix build problem of libfcgi++
In-Reply-To: <15397c627335fa50a090bd518b07bbf0b37ab47b.1336316166.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 May 2012 16:56:10 +0200")
References: <cover.1336316166.git.thomas.petazzoni@free-electrons.com>
 <cover.1336316166.git.thomas.petazzoni@free-electrons.com>
 <15397c627335fa50a090bd518b07bbf0b37ab47b.1336316166.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ehqx9v47.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Fix the way libfcgi++ is linked against libfcgi to solve the
 Thomas> http://autobuild.buildroot.org/results/f8e88e93f32e4e94ac9aef5a3f3f2826f1970453/build-end.log
 Thomas> build problem.

Committed, thanks.

-- 
Bye, Peter Korsgaard
