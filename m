From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jul 2019 22:42:08 +0200
Subject: [Buildroot] [PATCH 1/1] configs/atmel_sama5d27_som1: kernel
 needs host-openssl to build
In-Reply-To: <1564321818-4135-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Sun, 28 Jul 2019 15:50:18 +0200")
References: <1564321818-4135-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <877e81ki1r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > Since commit df7005975e5a8419918600b1fcac57799a0ff5da, the linux
 > configuration requires host-openssl to be built.

 > Fixes:

 >  https://gitlab.com/buildroot.org/buildroot/-/jobs/259847527

 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Committed, thanks.

-- 
Bye, Peter Korsgaard
