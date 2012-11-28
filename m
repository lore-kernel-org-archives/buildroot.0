From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Nov 2012 14:02:48 +0100
Subject: [Buildroot] PATCH > To integrate pycrypto into Buildroot
In-Reply-To: <07407110F438184D9D87521726FF42D41F64FE15@M357PRD1.ad.bcc.qld.gov.au>
References: <07407110F438184D9D87521726FF42D41F64FE15@M357PRD1.ad.bcc.qld.gov.au>
Message-ID: <20121128140248.56c55f5d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noel Roberts,

On Wed, 28 Nov 2012 05:05:29 +0000, Noel Roberts wrote:

> This patch allows Buildroot to cross compile the crypto libraries
> needed for python integration, enabling good cryptographic support
> within Python.

Good. The part adding the package in package/Config.in is missing.

> This is my first patch submission - please advise me, if I need to
> rework anything.

Could you use git send-email to send your patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
