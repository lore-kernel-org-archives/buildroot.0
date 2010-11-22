From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 23 Nov 2010 00:20:42 +0100
Subject: [Buildroot] samba build : location of valid.dat
Message-ID: <35499A6A25E24CA1BD8013F6FE3CA9AE@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
When trying to get samba running i noticed that the file valid.dat is
located in the build/staging dir : it should be in the build/target/usr/lib
directory.
 
I tried to fix it, but the samba build/make/install looks a bit too
complicated so for now i copied it manually. :)
 
Regards, Johan
 
 
 
 
 
 
 
btw i used samba 3.5.6
 
SAMBA_VERSION:=3.5.6
..
..
SAMBA_SUBDIR = source3
 
 
and got rid of the patches.
 
 
 
