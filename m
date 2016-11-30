From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 16:11:20 +0100
Subject: [Buildroot] [PATCH v2] uboot: support -b option for mkenvimage
In-Reply-To: <1480501953-31316-1-git-send-email-tiago.brusamarello@datacom.ind.br>
 (Tiago Brusamarello's message of "Wed, 30 Nov 2016 08:32:33 -0200")
References: <1480501953-31316-1-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <8737i9atpj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tiago" == Tiago Brusamarello <tiago.brusamarello@datacom.ind.br> writes:

 > When generating the environment image the target endianess should
 > be taken in account for CRC calculation purposes. For big endian
 > targets the -b flag should be passed to the mkenvimage tool.

 > Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>

 > ---
 > Changes v1 -> v2:
 >   - removed unwanted space inside macro call
 >   - changed 'findstring' to 'filter'

Committed after adding Arnout's Reviewed-by, thanks.

-- 
Bye, Peter Korsgaard
