From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Apr 2019 11:36:31 +0200
Subject: [Buildroot] [PATCH v4 1/2] arch: add support for Andes
 32-bit(nds32)
In-Reply-To: <20190409092655.GA31353@app09>
References: <20190402072340.17989-1-nylon7@andestech.com>
 <20190402072340.17989-2-nylon7@andestech.com>
 <20190403093114.6f6b3108@windsurf> <20190409092655.GA31353@app09>
Message-ID: <20190409113631.69aaea17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Apr 2019 17:26:56 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> We prefer add toolchain/toolchain-external/toolchain-external-andes-nds32....
> 
> So we will submit these items in the next patch(v5).
> 
> 1.add toolchain/toolchain-external/toolchain-external-andes-nds32
> 							+-- Config.in
> 							+-- Config.in.options
> 							+-- toolchain-external-andes-nds32.hash
> 							+-- toolchain-external-andes-nds32.mk
> 2.add support/config-fragments/autobuild
> 				+--toolchain-configs.csv
> 				+--andes-nds32.config

Seems perfect!

Looking forward to your v5.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
