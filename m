From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Aug 2011 21:45:20 +0200
Subject: [Buildroot] [PATCH] 'source' target should depend on 'dirs'
In-Reply-To: <d5142bce1ef181022512.1311759291@localhost6.localdomain6> (Thomas
 De Schampheleire's message of "Wed, 27 Jul 2011 11:34:51 +0200")
References: <d5142bce1ef181022512.1311759291@localhost6.localdomain6>
Message-ID: <87bow5nepb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> In the following command flow:
 Thomas> make distclean
 Thomas> make <board>_defconfig
 Thomas> make source

Committed, thanks.

-- 
Bye, Peter Korsgaard
