From: Mr.Satit Phermsawang <satit@mail.wbac.ac.th>
Date: Tue, 13 Mar 2007 17:48:03 +0700
Subject: [Buildroot] SMB segmentation fault
In-Reply-To: <mailman.604.1173779792.16070.buildroot@uclibc.org>
References: <mailman.604.1173779792.16070.buildroot@uclibc.org>
Message-ID: <20070313104727.M92050@mail.wbac.ac.th>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I fished buildroot(svn) with uclibc-snapshot and busybox1.2.2 with samba 
 support after boot the erorr message show: 
 
 Starting SMB services: Segmentation fault 
 Starting NMB services: Segmentation fault 
 
 and also issue command : 
 smbd 
 Segmentation fault 
 
 the same error. 
 
 Anybody have know to fix it? 
 
 -- 
 Satir P. 
 
