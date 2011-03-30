From: hamelin.philippe at ireq.ca <hamelin.philippe@ireq.ca>
Date: Wed, 30 Mar 2011 14:24:29 -0400
Subject: [Buildroot] busybox init seg fault with glibc 2.9
Message-ID: <76AAA44CB343D848919D13DE5B684A8801A42008@BORDEAUX.ireq.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
 
When using an external toolchain (crosstool-ng) using glibc 2.9, the busybox init fails to execute at startup (seg fault). The problem seems to have been already submitted on the mailing list:
 
http://lists.busybox.net/pipermail/buildroot/2010-April/033116.html
http://lists.busybox.net/pipermail/buildroot/2010-March/033069.html
 
The workaround proprosed here:
 
http://www.ftechworks.mydns.jp/blog/glibc/index.html
 
has solved the problem. I tested the patch on both PPC and ARM. I'm not sure if this should be submitted in glibc, busybox, crosstool-ng or busybox :-). Any advice?
 
------------------------------------
Philippe Hamelin, ing. jr, M. Ing
Chercheur / Researcher

T: 450-652-8499 x2198
F: 450-652-1316

Expertise robotique et civil
Institut de recherche d'Hydro-Qu?bec (IREQ)
1740, boul. Lionel-Boulet
Varennes (QC) J3X 1S1, Canada

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110330/52190865/attachment.html>
