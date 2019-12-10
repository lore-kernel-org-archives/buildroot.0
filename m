From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Dec 2019 09:05:30 +0100
Subject: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: bump
 version
In-Reply-To: <20191209223114.99264-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Mon, 9 Dec 2019 23:31:14 +0100")
References: <20191209223114.99264-1-giulio.benetti@benettiengineering.com>
Message-ID: <87fthshagl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > For A64 frequency stability.
 > git shortlog --invert-grep --grep=travis --no-merges
 > a5e38ca3f05f0f74fdd5e85a711c964383ad23df..
 > Vasily Khoruzhick (1):
 >       Set GPU clock to 432MHz on A64

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
