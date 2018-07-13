From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 12 Jul 2018 21:19:30 -0300 (BRT)
Subject: [Buildroot] How to change compiler to newer in old build-root
In-Reply-To: <CAPKSe_7odb9UrbX6Oz9=CP-XLGXNek5GebNDj9GB5ieH66t1Vg@mail.gmail.com>
References: <CAPKSe_6Q08-PYugmgAsGJ3waRGTWV2-V+vzT_KU5o7bk0fc58w@mail.gmail.com>
 <2097395198.3336152.1531394396552.JavaMail.zimbra@datacom.com.br>
 <CAPKSe_7odb9UrbX6Oz9=CP-XLGXNek5GebNDj9GB5ieH66t1Vg@mail.gmail.com>
Message-ID: <1571316215.3527652.1531441170443.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Denis Kotov" <redradist@gmail.com>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@busybox.net>
> Sent: Thursday, July 12, 2018 7:05:44 PM
> Subject: Re: [Buildroot] How to change compiler to newer in old build-root

> Thank you Carlos for reply,

> Okay, but what if I want to add newer compiler without changing buildroot
> version from 2014 to 2017.
> Is it possible ?

In theory, yes, but you'd need to cherry-pick dozens of commits that
upgraded the compiler support. Notice also that old packages may not compile
with newer compilers.

> And if no how to switch to new version of buildroot automatically. Is it
> possible ?

If you didn't change buildroot itself, yes. If you have local changes you
need to rebase them to a recent version. The best approach is to use a
br2-external, as described in the user manual.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
