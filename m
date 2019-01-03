From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 21:46:54 +0100
Subject: [Buildroot] [PATCH 00/11] support/download: fix scp and
 reintroduce source-check
In-Reply-To: <20190103204026.23512-1-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
Message-ID: <20190103214654.435a7043@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Jan 2019 21:40:15 +0100, Thomas De Schampheleire wrote:

> Hello and happy 2019 to you all!
> 
> This series has two parts:
> 1. fix the broken scp download helper (seems no-one is using it on recent
>    releases?) (patches 1 and 2)

Indeed, I believe the scp download method is rarely used and tested. The
only solution to not break it again is to have proper tests for it in
support/testing/. Should it be part of your patch series ? :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
