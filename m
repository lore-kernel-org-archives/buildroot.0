From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:57:06 +0200
Subject: [Buildroot] [PATCH 2/2] perl-sys-cpu: remove extraneous include
In-Reply-To: <20180927144646.20954-3-chrismcc@gmail.com>
References: <20180927144646.20954-1-chrismcc@gmail.com>
 <20180927144646.20954-3-chrismcc@gmail.com>
Message-ID: <20181008215706.0a196d99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Sep 2018 07:46:46 -0700, Christopher McCrory wrote:
> remove extraneous include <sys/unistd.h>
> in glibc this points back to include unistd.h
> neither musl, nor uclib have it.
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

The patch below was missing a description, and the commit log was
lacking a reference to the autobuilder failure being fixed. I've fixed
both issues, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
