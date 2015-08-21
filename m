From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Fri, 21 Aug 2015 10:29:08 -0700
Subject: [Buildroot] bootm - "Starting kernel"
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474AD9614@svr-wa-exch1.atg.lc>
 <CA+BsyQ7GRYhUA-2aJ+4qxaFnr6g0740B9sxEkGhXNEQ84ct3bw@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474AD968D@svr-wa-exch1.atg.lc>
 <CA+BsyQ5fZ=0krEW1ctCCV5R5Jaswe90_v6TYir0kGoEHK=FdHA@mail.gmail.com> 
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD96BF@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

I just succeeded in the booting of my Buildroot-2015.5 Linux-4.0.4 system on Marvell?s DB-88F6820-GP board. The solution to the "getty: bad speed" problem is the change of the "BR2_TARGET_GENERIC_GETTY_OPTIONS=8n1" line to "BR2_TARGET_GENERIC_GETTY_OPTIONS=""".

Thanks for your help on my Buildroot/Marvell work.

Tommy

This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
