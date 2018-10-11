From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Oct 2018 17:25:38 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181011161231.5d4bf9cd@windsurf> (Thomas Petazzoni's message of
 "Thu, 11 Oct 2018 16:12:31 +0200")
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf> <87y3b5ks97.fsf@tkos.co.il>
 <20181011085357.191cfccb@windsurf> <87efcwstjt.fsf@dell.be.48ers.dk>
 <20181011161231.5d4bf9cd@windsurf>
Message-ID: <87murk1p59.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> A quick fix would be to set BOA_MAKE to $(BR2_MAKE), but that is a bit
 >> of a hack.

 > Perhaps we need to think about a more global solution. How do we want
 > to use host-make ? If it's compiled, should it be used to build all
 > packages ? Should it only be used for glibc ? In the latter case, how
 > do we "hide" it from all packages, and make it used only by glibc ?

Using it for everything is probably the simplest solution / most similar
to other tools.

If we only use it for glibc (for now), then we need to install it as
something else than 'make' (glibc-make? make-4?).

-- 
Bye, Peter Korsgaard
