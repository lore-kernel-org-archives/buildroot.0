From: =?ISO-8859-1?Q?Knut-H=E5vard_Aksnes?= <kna@tirsdagsklubben.nu>
Date: Mon, 26 May 2008 18:50:29 +0200
Subject: [Buildroot] Anyone try simulating their Buildroot-created
 filesystem image in QEMU?
In-Reply-To: <270858e90805260907qe8164c2i47a230009c949191@mail.gmail.com>
References: <326f33790805231205j302081b1oec193841dac80e0c@mail.gmail.com>	
	<483AC264.6080500@tirsdagsklubben.nu>
	<270858e90805260907qe8164c2i47a230009c949191@mail.gmail.com>
Message-ID: <483AEA55.5030603@tirsdagsklubben.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wayne Keenan wrote:
> Hi,
>
> How about using the qemu-img  conversion utility to convert from 
> ext[2|3] (or other) to qcow (qemu) format ? 
>
>
That's OK to do as soon as you have a disk image available in some 
format. The problem is that buildroot doesn 't build disk images it 
builds partition images. What's missing is some kind of simple tool that 
wraps one or more partition images (plus optionally some kind of Master 
Boot Record) into a disk image.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: kna.vcf
Type: text/x-vcard
Size: 507 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080526/128891aa/attachment.vcf 
