From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Mar 2012 00:05:16 +0100
Subject: [Buildroot] [PATCH 06/20] usbutils: bump version to 005
In-Reply-To: <1331502489-5036-6-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 11 Mar 2012 18:47:55 -0300")
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <1331502489-5036-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87obs2vivn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump usbutils version to 005 and also switch to a debian mirror since
 Gustavo> it's still missing upstream.

Committed, thanks. I added a comment about why we autoreconf and changed
it to use a stable snapshot.debian.org URL instead.

-- 
Bye, Peter Korsgaard
