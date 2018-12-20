From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Dec 2018 14:04:27 +0100
Subject: [Buildroot] Cross compiling kernel module for the target
In-Reply-To: <CA+OsCCRL-rds9BdUtnaQLANeB+OYrJ=bB+GmqnJdfDzfP1n+Zg@mail.gmail.com>
References: <CA+OsCCTCqQ+Fne+=VtXKgi5E_ezkdTAva-zTk6KaWa9egem0Sg@mail.gmail.com>
 <20181220090411.7ab00f70@windsurf>
 <CA+OsCCQ2TWYiEv-a8uRaJVSd4YX9A4T_EV1ihC1Y2ZyrNPAkag@mail.gmail.com>
 <20181220100733.5c6d0860@windsurf>
 <CA+OsCCRWydtsa1RVjGhc8ZdV-guMuA1ORauct4XH8ZYjgk6zvw@mail.gmail.com>
 <20181220102059.1884d72d@windsurf>
 <CA+OsCCRL-rds9BdUtnaQLANeB+OYrJ=bB+GmqnJdfDzfP1n+Zg@mail.gmail.com>
Message-ID: <20181220140427.63b19478@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Dec 2018 10:34:42 +0100, ?ukasz Przenios?o wrote:

> Thomas, I do build my kernel using buildroot- it gives me the cross
> compiling tools. My problem is, that I think that the buildroot doesnt
> provide the sources for me in the output.

I'm sorry, but I don't really understand what you're saying.

If you are building the Linux kernel with Buildroot, so you definitely
have a directory called output/build/linux-<version>/ which contains
the kernel source code, the kernel configuration (.config file) and
all the object files/images that result from a kernel build.

If you don't have this folder, then you are definitely not building the
Linux kernel with Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
