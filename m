From: Nicole <nicole@cats-muvva.net>
Date: Fri, 15 Jun 2012 10:38:48 +0100
Subject: [Buildroot] pppd patch
Message-ID: <4FDB02A8.1010509@cats-muvva.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas (I decided you weren't Italian after all),

The patch I had is obviated by building the resolv stub for uClib. If 
you don't build these stubs, then libresolv is not available which halts 
the build, even though all the symbols that the developer expected to be 
resolved by that library have been resolved elsewhere by uClibc.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 2332 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120615/45166482/attachment.p7s>
