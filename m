From: M. Edward (Ed) Borasky <znmeb@cesmail.net>
Date: Wed, 22 Nov 2006 13:11:07 -0800
Subject: [Buildroot] Error compiling svn revision 16632.
In-Reply-To: <1d09f8b80611221150j5f12383fl1f4cb914f9c0d733@mail.gmail.com>
References: <1d09f8b80611221150j5f12383fl1f4cb914f9c0d733@mail.gmail.com>
Message-ID: <4564BCEB.2070407@cesmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Buik wrote:
> I used svn to checkout the latest revision 16632 and set up default
> configuration with make menuconfig, but when trying to compile I
> immidatly get the error:
> target/cpio/cpioroot.mk:10: *** missing separator.  Stop.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   
See bug http://bugs.uclibc.org/view.php?id=1099 ... I posted a fix

-- 
M. Edward (Ed) Borasky, FBG, AB, PTA, PGS, MS, MNLP, NST, ACMC(P)
http://borasky-research.blogspot.com/

If God had meant for carrots to be eaten cooked, He would have given rabbits fire.
