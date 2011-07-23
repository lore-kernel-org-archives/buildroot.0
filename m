From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Jul 2011 11:48:29 +0200
Subject: [Buildroot] [PATCH] dropbear: Create destination directories
	before use in install stage.
In-Reply-To: <1311348822.2189.78.camel@dublxciaranr1.verifone.com> (Quotient
 Remainder's message of "Fri, 22 Jul 2011 16:33:36 +0100")
References: <1311332746-8143-1-git-send-email-quotientvremainder@gmail.com>
 <87sjpyy2fc.fsf@macbook.be.48ers.dk>
 <1311348822.2189.78.camel@dublxciaranr1.verifone.com>
Message-ID: <87d3h1xr82.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Quotient" == Quotient Remainder <quotientvremainder@gmail.com> writes:

 >> Real name please.

 Quotient> I accept fully that as the lead developer on BR you're free
 Quotient> to choose and enforce any set of rules as you see fit.
 Quotient> However, contributions under pseudonyms have long been a part
 Quotient> of Internet culture.  Isn't that name just as valid as any
 Quotient> other less suspicious-looking (but equally unverified) names
 Quotient> that are on any other patches?  Will you insist on this real
 Quotient> name policy?

I'm afraid so. Signed-off-by's don't make any sense if they are clearly
made up names. I agree that we cannot ensure that people don't make up
names, but atleast we try.

This is nothing special to buildroot, you'll find lots of other projects
requiring it, expecially the ones doing kernel-style
signed-off-by's.

E.G. from the kernels Documentation/SubmittingPatches:

then you just add a line saying

        Signed-off-by: Random J Developer <random@developer.example.org>

using your real name (sorry, no pseudonyms or anonymous contributions.)

And U-Boot:

http://lists.denx.de/pipermail/u-boot/2011-January/085905.html

And anyway, it's an illusion to think that you can truly remain
anonymous on the internet. Based on your mail headers I would say you
work for Verifone in their London based office. That combined with the
fact that you use Evolution on FC15 probably narrows it down quite a
bit.

-- 
Bye, Peter Korsgaard
