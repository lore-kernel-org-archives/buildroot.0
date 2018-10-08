From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:56:36 +0200
Subject: [Buildroot] [PATCH 1/2] perl-sys-cpu: disable static builds
In-Reply-To: <20180927144646.20954-2-chrismcc@gmail.com>
References: <20180927144646.20954-1-chrismcc@gmail.com>
 <20180927144646.20954-2-chrismcc@gmail.com>
Message-ID: <20181008215636.28148336@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Sep 2018 07:46:45 -0700, Christopher McCrory wrote:
> Disable static builds like other perl modules
> fixes autobuild failures
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/perl-sys-cpu/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Your commit log was missing a reference to the autobuilder failure
being fixed. I've added that and applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
