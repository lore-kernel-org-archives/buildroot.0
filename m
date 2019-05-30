From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:07:01 +0200
Subject: [Buildroot] [PATCH]
 toolchain/toolchain-external/toolchain-external-andes-nds32: add missing
 dependencies/select
In-Reply-To: <20190528091426.10302-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 28 May 2019 11:14:26 +0200")
References: <20190528091426.10302-1-thomas.petazzoni@bootlin.com>
Message-ID: <87blzj38ca.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This external toolchain is pre-built for x86, so it can only work on
 > x86 and x86-64, and for the latter, the ia32 libraries are necessary.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
