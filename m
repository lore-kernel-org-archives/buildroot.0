From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 1 Feb 2015 20:51:48 +0100
Subject: [Buildroot] target options for Cortex A8/A9
Message-ID: <8F194C039449403C9E9AFFB360BCF394@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

I am using imx53, this cpu has according to the datasheet an NEON SIMD media accelerator
and an VFPv3 co-processor.
So I would assume the same selections options as for the A9.
I was wondering what makes the target options different for A8 vs A9.

I would think that for the imx53 it sould be the same as for the A9,
That is an NEON SIMD extension and a vfpv3 floating point engine.
Please clarify, it is a bit confusing to me.

For the A8 I can select vfpv3 OR Neon, but not vfpv3 WITH NEON extension.

Regards
Sagaert Johan


-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150201/fbbe27a8/attachment.bin>
