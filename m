From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 09:43:31 +0200
Subject: [Buildroot] [PATCH] package/python-rpi-gpio: add LICENCE.txt
 file and hash codes
In-Reply-To: <20191009171543.8475-1-haylocki@yahoo.co.uk>
References: <20191009171543.8475-1-haylocki@yahoo.co.uk>
Message-ID: <20191010094331.05d4ba48@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ian,

On Wed,  9 Oct 2019 18:15:42 +0100
haylocki at yahoo.co.uk wrote:

> From: Ian Haylock <haylocki@yahoo.co.uk>

Missing Signed-off-by.

> 
> ---
>  package/python-rpi-gpio/LICENCE.txt          | 10 ++++++++++

Why are you adding the license file here ? It should be part of the
upstream package source code.

Also, only add a single sha256 hash for the license file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
