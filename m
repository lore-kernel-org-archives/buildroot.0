From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Jan 2014 09:45:05 +0100
Subject: [Buildroot] [PATCH] busybox 1.22.x: disable touch -h
In-Reply-To: <1388623111-19670-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 1 Jan 2014 21:38:31 -0300")
References: <1388623111-19670-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87eh4q93hq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Disable the busybox touch --no-dereference since it requires lutimes
 > support and breaks old toolchains that don't support it (example:
 > avr32). Probably nobody cares that much since it's a new feature. Fixes:
 > http://autobuild.buildroot.net/results/9c2/9c29379719ae5cf5800c0dcb4cf514c5dc15d9b6/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
