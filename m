From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 8 Feb 2012 10:38:42 +0100
Subject: [Buildroot] FW: Buildroot RFS Login Question
In-Reply-To: <87bop9zrvp.fsf@macbook.be.48ers.dk>
References: <CB5771EE.2EBB%donald.poole@swri.org> <4F321CF0.7000305@renta.net>
 <87bop9zrvp.fsf@macbook.be.48ers.dk>
Message-ID: <CAHXCMMJD6Mh6XC6uDWncbq=ux3tBey2F8JRDDXkXzHQL=DOyPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/2/8 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Mark" == Mark Constable <markc@renta.net> writes:
>
> ?Mark> On 08/02/12 16:28, Poole, Donald R. wrote:
> ?>> Sam, I took a look at my /etc/passwd and /etc/shadow in my rootfs
> ?>> and each file is populated, but how do I know if they are valid?
>
http://linux.die.net/man/5/passwd
http://linux.die.net/man/5/shadow
or
have a look at the default files are located in ./fs/skeleton/etc
(they are valid, of course).


-- 
Sam
