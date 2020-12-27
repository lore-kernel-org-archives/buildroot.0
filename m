From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:35:19 +0100
Subject: [Buildroot] [PATCH 2/3] package/freescale-imx/imx-gpu-viv:
 install Vendor ICDs file (Vivante.icd)
In-Reply-To: <20201223153325.12302-2-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 23 Dec 2020 16:33:24 +0100")
References: <20201223153325.12302-1-romain.naour@smile.fr>
 <20201223153325.12302-2-romain.naour@smile.fr>
Message-ID: <87pn2vbq9k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Without this file, the clinfo binary provided by the package doesn't
 > detect the opencl support.

 > Fixes:
 > https://github.com/boundarydevices/buildroot-external-boundary/issues/5

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Gary Bisson <gary.bisson@boundarydevices.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
