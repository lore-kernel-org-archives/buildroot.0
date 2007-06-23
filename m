From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 23 Jun 2007 15:55:39 +0200
Subject: [Buildroot] Buildroot failed arm linux eabi gcc 4.1.2
In-Reply-To: <200706221652.31953.stuart.wood@labxtechnologies.com>
References: <200706221652.31953.stuart.wood@labxtechnologies.com>
Message-ID: <20070623135539.GL4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 22, 2007 at 04:52:31PM -0400, Stuart Wood wrote:
>Hi All, 
>
>Any thoughts on how to fix this would be appreciated!
>
>Thanks 
>
>Stuart
>
>My configuration is:

>BR2_ARM_EABI=y

>BR2_GNU_TARGET_SUFFIX="linux-uclibc"

This is plain wrong. You clearly didn't read the helptext.

Works fine for me with gcc-4.2.0 softfloat/eabi and
binutils-2.17.50.0.16, headers from 2.6.21.5
