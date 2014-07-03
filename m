From: Robert Larsen <robert@the-playground.dk>
Date: Thu, 03 Jul 2014 16:25:06 +0200
Subject: [Buildroot] Filesystem being corrupted
In-Reply-To: <53B55511.8030706@the-playground.dk>
References: <53B5331B.9030703@the-playground.dk>
 <53B54CEC.5070803@zacarias.com.ar> <53B55511.8030706@the-playground.dk>
Message-ID: <53B567C2.2070502@the-playground.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/2014 03:05 PM, Robert Larsen wrote:
> On 07/03/2014 02:30 PM, Gustavo Zacarias wrote:
>> Any reason in particular to stick with vexpress?
> Not really, that was what I was used to. I'll try versatile.
>
Hmm, building with versatile defconfig hangs qemu. I tried both '-M
versatilepb' and '-M versatileab'
Both hang after this message:

Uncompressing Linux... done, booting the kernel.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 246 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140703/7cb760fc/attachment.asc>
