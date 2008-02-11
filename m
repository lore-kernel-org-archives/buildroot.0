From: Wayne Keenan <wayne.keenan@gmail.com>
Date: Mon, 11 Feb 2008 17:32:11 +0000
Subject: [Buildroot] kernel cross compilation problem (at91sam9260)
In-Reply-To: <642838.65822.qm@web23403.mail.ird.yahoo.com>
References: <642838.65822.qm@web23403.mail.ird.yahoo.com>
Message-ID: <270858e90802110932s7b41e7e3v2d6dd6323c3dcf4f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Dropping back to using gcc 3.4.6  and uclib x.x.28 worked for me.  - not a
proper fix, but it was a combination that worked andI was fed up of trying
combinations :)


Regards
Wayne


On Feb 11, 2008 4:10 PM, grego rigolo <gregorigolo2002@yahoo.fr> wrote:

> hello,
> I'm using the buildroot-20080206.tar.bz2 package to build a rootfilesystem
> and a cross compilation toolchain for my embedded board (sam9260).
> I tried to cross compile (arm-linux-gcc-4.1.2) a 2.6.23 linux kernel
> seperately (not the one included in buildroot) , and i noticed that the size
> had increased by 3Mb respect to my old version.
> On the other hand when i try to use the generated kernel, it hangs at the
> stage
> uncompressing Linux ....................
> Does anyone encounters this kind of problem ?
> greg
>
>
> ------------------------------
> Ne gardez plus qu'une seule adresse mail ! Copiez vos mails<http://fr.rd.yahoo..com/mail/mail_taglines/trueswitch/SIG=11gshn0bu/**http%3A%2F%2Fwww.trueswitch.com%2Fyahoo-fr%2F>vers Yahoo! Mail
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080211/7b6f612f/attachment-0001.htm 
