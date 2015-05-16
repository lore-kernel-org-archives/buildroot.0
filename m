From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 16 May 2015 17:40:22 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-05-15
In-Reply-To: <20150516063015.D2BB91018B2@stock.ovh.net>
References: <20150516063015.D2BB91018B2@stock.ovh.net>
Message-ID: <CAMo8Bf+bnv4u=6bh3iots6rr0n8+i2AHHP4Y=mGbVchmWHn_eQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 16, 2015 at 9:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2015-05-15
>       xtensa |                  glibmm-2.36.1 | NOK | http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/

Apparently arch ABI compiler flags need to be passed to libstdc++ build.
Looking at it.

>       xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/5d17055027055ffd33fcd28b208130afb26343c9/

jasper overwrites C flags completely when building with debug info, losing
arch ABI compiler flags. Will fix.

-- 
Thanks.
-- Max
