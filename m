From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 15:38:22 +0100
Subject: [Buildroot] [PATCH 2/2] fio: disable on SuperH
In-Reply-To: <1457620346-18948-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 10 Mar 2016 15:32:26 +0100")
References: <1457620346-18948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1457620346-18948-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ziu6mm8x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > fio doesn't build on SuperH due to arch_flags being undefined while
 > building the test programs. Since the fix isn't immediate, the bug was
 > reported upstream, and this commit disables fio on SuperH until it
 > gets fixed upstream.

 > Fixes:

 >   http://autobuild.buildroot.net/results/578/578ae9da10d017ee9e2c15d37014f31a1114ef3a/build-end.log

 > Fixes #8751.

Committed, thanks.

-- 
Bye, Peter Korsgaard
