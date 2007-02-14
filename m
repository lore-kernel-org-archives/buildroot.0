From: Piotr Adam Zolnierczuk <pzolnier@indiana.edu>
Date: Wed, 14 Feb 2007 14:31:47 -0500
Subject: [Buildroot] (How-to properly use) external toolchain?
Message-ID: <45D363A3.3000303@indiana.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I could not find answer in a FAQ nor in the mailing list archives, so I 
am posting the question

Problem:
I am not sure I understand the meaning of
BR2_TOOLCHAIN_EXTERNAL_LIB_C and BR2_TOOLCHAIN_EXTERNAL_LIBS config 
parameters

Synopsis:
Here's what I did
1. Got buildroot (revision 17875) and succesfully build toolchain only 
(gcc-4.1.1, binutils-2-17 and gdb-6.5, uClib latest snapshot) and 
installed it to /opt/arm directory (by setting 
BR2_STAGING_DIR="/opt/arm"). All target options were disabled.
2. Using the above I was able to compile linux kernel that works on my 
board (it happens to be at91sam9260ek, but that is I hope irrelevant)
3. Now I unpack buildroot to a separate directory and configure it to 
use my /opt/arm external toolchain. All works fine except that I have to 
manually copy several libs from /opt/arm/lib to 
(...)/buildroot/build_arm/root/lib. I tried several different 
BR2_TOOLCHAIN_EXTERNAL_LIB_C and BR2_TOOLCHAIN_EXTERNAL_LIBS but they 
seem to be simply ignored

Q: Any ideas as to what am I doing wrong?

Thanks

Piotr




-- 
 ________________________________________________________________
 Piotr Adam Zolnierczuk
 Indiana University                        phone:  (812) 855-3613
 Cyclotron Facility                        fax:    (812) 855-6645
 2401 Milo B Sampson Ln             e-mail:  pzolnier at indiana.edu
 Bloomington,IN 47408, USA    http://www.iucf.indiana.edu/~zolnie
 ________________________________________________________________
                   written on recycled electrons                 	


-------------- next part --------------
A non-text attachment was scrubbed...
Name: pzolnier.vcf
Type: text/x-vcard
Size: 305 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070214/9733cb6a/attachment.vcf 
