From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 09:47:14 +0100
Subject: [Buildroot] [PATCH v2 2/2] linux-firmware: add menu for Intel
 QuickAssist firmware
In-Reply-To: <20180125172951.31196-2-casantos@datacom.ind.br> (Carlos Santos's
 message of "Thu, 25 Jan 2018 15:29:51 -0200")
References: <20180125172951.31196-1-casantos@datacom.ind.br>
 <20180125172951.31196-2-casantos@datacom.ind.br>
Message-ID: <87k1w1831p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Firmware required when Intel QuickAssist is enabled in the kernel via
 > CRYPTO_DEV_QAT_DH895xCC, CRYPTO_DEV_QAT_C3XXX or CRYPTO_DEV_QAT_C62X.

 > See https://dpdk.org/doc/guides/cryptodevs/qat.html

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
