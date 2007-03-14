From: Mr.Satit Phermsawang <satit@mail.wbac.ac.th>
Date: Wed, 14 Mar 2007 10:10:05 +0700
Subject: [Buildroot] SMB segmentation fault
In-Reply-To: <45F77169.6070004@critical.com>
References: <45F77169.6070004@critical.com>
Message-ID: <20070314030827.M69587@mail.wbac.ac.th>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, I fished buildroot(svn) on X86 platform with uclibc-snapshot and 
busybox1.2.2 with samba  support after boot the erorr message show: 

Starting SMB services: Segmentation fault 
Starting NMB services: Segmentation fault 

and also issue command : 
smbd 
Segmentation fault 

the same error. 

Anybody have know to fix it? 

-- 
Satir P. 
