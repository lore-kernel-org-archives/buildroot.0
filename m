From: Erik Andersen <andersen@codepoet.org>
Date: Tue, 23 Jan 2007 17:07:46 -0700
Subject: [Buildroot] [PATCH] Select MTD before EXT2/CRAMFS/SQUASHFS are
	built
In-Reply-To: <1169591688.5361.7.camel@elrond.sweden.atmel.com>
References: <1169591688.5361.7.camel@elrond.sweden.atmel.com>
Message-ID: <20070124000746.GA17761@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue Jan 23, 2007 at 11:34:48PM +0100, Ulf Samuelsson wrote:
> Building a file sysrtem will fail if the mtd tools are not
> available. THis patch ensure MTD is selected if either of
> ext2/cramfs/squashfs are selected.

Nak.  There are a great many situations where people use ext2
and/or cramfs and/or squashfs without wanting to also use MTD...
I happen to use all of them without wanting MTD at various times.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
