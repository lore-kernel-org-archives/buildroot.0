From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Mon, 26 Oct 2015 09:29:25 -0700
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to enable Node.js
Message-ID: <944894A3EB1D044A9003B2F944389BB20474D39044@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot Busybox,

My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.08.1. I made the former meet the latter's requirements. My target board is Marvell ARMADA A385 (ARM-Cortex-A9) DB-88F6820-GP.

Last week I built the 4.1.4 system with Node.js with no problems. This morning I succeeded in booting it on my board.

I ran the "npm -version" command and received a Segmentation fault.

I am resolving this problem now. Attached is my .config file. Your experience sharing is welcome!

Tommy

________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151026/a812fee9/attachment.html>
