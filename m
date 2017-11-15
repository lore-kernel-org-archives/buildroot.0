From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Nov 2017 10:17:37 +0100
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.14.1
In-Reply-To: <9307d429db0bf9d7d141aa49ddc2e72425460882.1510684057.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 14 Nov 2017 20:27:37 +0200")
References: <9307d429db0bf9d7d141aa49ddc2e72425460882.1510684057.git.baruch@tkos.co.il>
Message-ID: <87wp2rlx3i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Remove uClibc build fix; current uClibc version defines the required
 > macro.

 > Remove static link fix; fixed upstream.

 > Rebase the musl libc-compat.h workaround to adapt to upstream headers
 > location change.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I see that you didn't mark this as being for next. Is that on purpose?
If so, why?

-- 
Bye, Peter Korsgaard
