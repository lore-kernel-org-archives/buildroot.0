From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Apr 2016 23:37:08 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
	version with rpi/rpi2
In-Reply-To: <57212C26.5090308@beneth.fr> (=?utf-8?Q?=22Beno=C3=AEt?=
 Mauduit"'s message of "Wed, 27 Apr 2016 23:16:22 +0200")
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 <878u00o2oi.fsf@dell.be.48ers.dk>
 <CALtfCQbwAPAwPjyyoY6bLdzsg3i86ZrC8bQor1ycbx8VBKm9og@mail.gmail.com>
 <874maoo0al.fsf@dell.be.48ers.dk> <87wpnkmf65.fsf@dell.be.48ers.dk>
 <20160426213916.241241c7@gmx.net> <571FD66D.9050305@beneth.fr>
 <87d1pa23b2.fsf@dell.be.48ers.dk> <57212C26.5090308@beneth.fr>
Message-ID: <87oa8uzqbf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Mauduit <bmauduit@beneth.fr> writes:

 > On 04/27/2016 10:40 PM, Peter Korsgaard wrote:
 >> 
 >> Ehh, but we are already using rpi-4.4.y? (3de2328 from April 21st) -
 >> With that said, we can certainly move to e63db5. Care to send a patch to
 >> update raspberry{,2,3}_defconfig?
 >> 

 > Ouuups, I was already on this 4.4 branch after trying to work on Kodi,
 > before April 21st, I missed the buildroot change...

 > Patchs are ready for raspberry{,2,3}_defconfig, I am just waiting a
 > build to confirm that it is working.

Thanks. What about rpi1?

 > I took the last commit on rpi-4.4.y branch, which is now :
 > 26f3b72a9c049be10e6af196252283e1f6ab9d1f. (Kernel 4.4.8).

Ok.

 > Just a question, seeing how buildroot manage defconfig : Is it really
 > useful to add comments (And re-order Kconfig option) in defconfig ? Some
 > people read defconfigs ?

We don't really have any strong policy about it. I do find the commits
are nice for documentation, but it is true that they break 'make
savedefconfig'.

Anybody else having an opinion about this?

-- 
Venlig hilsen,
Peter Korsgaard 
