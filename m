From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Mar 2014 23:04:00 +0100
Subject: [Buildroot] [PATCH] lvm2: needs threads
In-Reply-To: <1395092813-1988-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 17 Mar 2014 18:46:53 -0300")
References: <1395092813-1988-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y5084h4f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > lvm2 needs threads because of commit
 > 35d3713bdc20a3ac22537ca04b0c1c6deab625cc
 > Fixes:
 > http://autobuild.buildroot.net/results/b4d/b4dcd9e98c4ea61f81b28675c0f87cfb2341f091/

Committed, thanks.

-- 
Bye, Peter Korsgaard
