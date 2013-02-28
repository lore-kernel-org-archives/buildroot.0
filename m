From: Philipp Claves <claves@budelmann-elektronik.com>
Date: Thu, 28 Feb 2013 15:04:42 +0100
Subject: [Buildroot] [PATCH] opkg: Add option to enable package verification
	support with GnuPG
Message-ID: <64891469.UzFDExKfyb@arawn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches enables the opkg support for verifying package signatures 
with gnupg.

The first two patches add the required libraries (libassuan and libgpgme).
The third adds new option: opkg-gnupg-support. It selects the needed packages 
and sets the --enable-gpg configure option for opkg.

The patch dependency chain is:
  (0003) opkg -> (0002) libgpgme -> (0001) libassuan

Comments are welcome.

Regards,
Philipp Claves
-- 
Budelmann Elektronik GmbH
Von-Renesse-Weg 60
48163 M?nster
Germany

Tel.  +49 (0)2501 9208440
Fax   +49 (0)2501 5887024
claves at budelmann-elektronik.com
www.budelmann-elektronik.com

General Managers: Dipl.-Kffr. Jeannine Budelmann,
Dipl.-Ing. Christoph Budelmann, Ing?nieur diplom? de
l'Ecole nationale d'Electronique et de ses Applications
Registered Office: M?nster, Germany
Registered Court: M?nster HRB 12729     
VAT Identification Number: DE 272 067 273
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Add-libassuan-IPC-library.patch
Type: text/x-patch
Size: 2213 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130228/36e85af4/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-Add-GnuPG-Made-Easy-gpgme-library.patch
Type: text/x-patch
Size: 2261 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130228/36e85af4/attachment-0001.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-opkg-Add-gnupg-signature-checking-support.patch
Type: text/x-patch
Size: 1647 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130228/36e85af4/attachment-0002.bin>
