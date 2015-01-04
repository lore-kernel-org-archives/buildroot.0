From: Rudy Rockstar <rudyrockstar@hotmail.com>
Date: Sat, 3 Jan 2015 20:59:57 -0500
Subject: [Buildroot]  - website suggestion
Message-ID: <BLU175-W37B182F89D913F30D1EED9D45B0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




Your efforts are greatly appreciated. Thank you all.

In the spirit of time efficiency (in layman speak : laziness), and getting newbies toes into the water

WEBSITE SUGGESTIONS:

for: http://buildroot.uclibc.org/downloads/manual/manual.html#requirement-mandatory 

#-- Ease platform readiness evaluation via copy and paste shell script fun
 
which sed make binutils build-essential gcc g++ bash patch gzip bzip2 perl tar cpio python unzip rsync wget | wc -l;

echo "sed make binutils build-essential gcc g++ bash patch gzip bzip2 perl tar cpio python unzip rsync wget" | wc -w;

#-- If numbers are disparate find whats missing (or up arrow twice and erase "| wc -l"):

which sed make binutils build-essential gcc g++ bash patch gzip bzip2 perl tar cpio python unzip rsync wget;

#-- And then install programs not listed using your platform package/program manager.#-- This can maybe be done fancier at risk of losing execution ubiquity.


regards, 
~Rudy
________________________________________________..!@#$%&%

RudyRockstar.com  .  678 568-9318  . ICQ6636643 
__________________rudyrockstar at _____________________________
Gmail/Yahoo/Hotmail/Myspace/Twitter
MSN/Skype/PalTalk/Facebook/AIM/ICQ....more>> RudyRockstar.com
"  "" " ""     " "" """" """ "" """ """  """"" """" "" """" """ """"" """" """"""" " '' '   '' '
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150103/fbc42e00/attachment.html>
