From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Sat, 23 Jun 2007 20:12:53 +0700
Subject: [Buildroot] hdparm file not found
Message-ID: <5d75f4610706230612m6ec6e43cx3cd9f2e818ff1ab6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using buildroot-20070622.tar.bz2, I get this when trying to build hdparm:

wget --passive-ftp -P
/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/dl
http://www.ibiblio.org/pub/Linux/system/hardware//hdparm-6.7.tar.gz
--20:10:14--  http://www.ibiblio.org/pub/Linux/system/hardware//hdparm-6.7.tar.gz
           => `/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/dl/hdparm-6.7.tar.gz'
Resolving www.ibiblio.org... 152.46.7.80
Connecting to www.ibiblio.org|152.46.7.80|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
20:10:16 ERROR 404: Not Found.

make: *** [/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/dl/hdparm-6.7.tar.gz]
Error 1

The side only has hdparm-7.6.tar.gz available in that directory.
