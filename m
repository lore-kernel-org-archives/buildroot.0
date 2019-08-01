From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 20:24:50 +0200
Subject: [Buildroot] [PATCH v3 3/3] configs/atmel: kernel needs host
 openssl to build
In-Reply-To: <20190731134649.20701-3-ludovic.desroches@microchip.com> (Ludovic
 Desroches's message of "Wed, 31 Jul 2019 15:46:49 +0200")
References: <20190731134649.20701-1-ludovic.desroches@microchip.com>
 <20190731134649.20701-3-ludovic.desroches@microchip.com>
Message-ID: <87sgqku4jx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@microchip.com> writes:

 > Since commit df7005975e5a8419918600b1fcac57799a0ff5da, the linux
 > configuration requires host-openssl to be built.

 > Reported-by: Pierre-Jean Texier <pjtexier@koncepto.io>
 > Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
