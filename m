From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Feb 2012 08:49:46 +0100
Subject: [Buildroot] FW: Buildroot RFS Login Question
In-Reply-To: <4F321CF0.7000305@renta.net> (Mark Constable's message of "Wed,
 08 Feb 2012 16:57:52 +1000")
References: <CB5771EE.2EBB%donald.poole@swri.org> <4F321CF0.7000305@renta.net>
Message-ID: <87bop9zrvp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Constable <markc@renta.net> writes:

 Mark> On 08/02/12 16:28, Poole, Donald R. wrote:
 >> Sam, I took a look at my /etc/passwd and /etc/shadow in my rootfs
 >> and each file is populated, but how do I know if they are valid?

 Mark> FWIW I find on a fresh install I have to login as "default" and then
 Mark> "su -" to root.

With the default skeleton the root user has an empty password, so you
should be able to login as root on the console (not ssh, as that
typically doesn't allow empty passwords).

-- 
Bye, Peter Korsgaard
