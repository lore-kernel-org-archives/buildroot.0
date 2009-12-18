From: Damien RANNOU <damien.rannou@diateam.net>
Date: Fri, 18 Dec 2009 10:21:35 +0100
Subject: [Buildroot] using target_skeleton directory
Message-ID: <4B2B499F.6080203@diateam.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm using buildroot-2009.11 and would like to have informations about 
target_skeleton directory. In the documentation it's said that I can 
customize my filesystem using |target/generic/target_skeleton/ |and just 
type "make" to have all my files copied into output/target, and the 
.tar.bz2 image file. But I made some tests, and it appears that files 
put in the /root directory (of target_skeleton) are only copied if I 
'make distclean' before|.|

Is it a bug ? A documentation problem ?


Best Regards||

 -- 

Damien RANNOU

-------------------------------
www.diateam.net
Diateam
41, rue Yves Collet
29200 BREST
