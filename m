From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Jul 2015 23:53:52 +0200
Subject: [Buildroot] [PATCH 1/2] system/skeleton: remove random-seed
In-Reply-To: <314559b27c9c888a8939941b1b4ba500f20b4294.1436333052.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 8 Jul 2015 08:24:11 +0300")
References: <314559b27c9c888a8939941b1b4ba500f20b4294.1436333052.git.baruch@tkos.co.il>
Message-ID: <877fqami33.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Seeding the entropy pool with a known seed makes more harm than good. This is
 > especially bad for when /etc is not on a persistent writable storage, so the
 > entropy pool is seeded with the same value on every boot. Just drop it.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
