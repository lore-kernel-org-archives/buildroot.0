From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Aug 2019 09:13:27 +0200
Subject: [Buildroot] [PATCH] packages/devmem2: remove from all board
 configurations
In-Reply-To: <20190813051258.xtkrbs3elkw33mft@M43218.corp.atmel.com> (Ludovic
 Desroches's message of "Tue, 13 Aug 2019 07:12:58 +0200")
References: <20190812181207.25287-1-unixmania@gmail.com>
 <20190813051258.xtkrbs3elkw33mft@M43218.corp.atmel.com>
Message-ID: <877e7hmtbc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@microchip.com> writes:

 > Hi Carlos,
 > On Mon, Aug 12, 2019 at 03:12:07PM -0300, unixmania at gmail.com wrote:
 >> 
 >> From: Carlos Santos <unixmania@gmail.com>
 >> 
 >> It is not used by any other application selected by those defconfigs.
 >> 

 > It's only here for debug purpose. Is the Busybox devmem version now
 > enabled by default in order to have something in replacement?

Yes it is:

grep DEVMEM package/busybox/busybox.config
CONFIG_DEVMEM=y

-- 
Bye, Peter Korsgaard
