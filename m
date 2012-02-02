From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 13:19:06 +0100
Subject: [Buildroot] [PATCH] pixman: Bump version to 0.24.2
In-Reply-To: <CAFbHwiSZURBTrTdhGsqEu+ZNoJ+u7yCGvH4947zG1Faec3Awxg@mail.gmail.com>
 (Will Newton's message of "Thu, 2 Feb 2012 12:15:02 +0000")
References: <CAFbHwiTE-oKMz5iyy284Kz++1VwWhei-T=iAhUVx3o2_GJs-jA@mail.gmail.com>
 <87d39xbfo0.fsf@macbook.be.48ers.dk>
 <CAFbHwiSZURBTrTdhGsqEu+ZNoJ+u7yCGvH4947zG1Faec3Awxg@mail.gmail.com>
Message-ID: <878vklbf7p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

Hi,

 Will> Ah ok, I was unsure why the patch was there to begin with and
 Will> assumed it was the GTK+ dependency it was avoiding. I didn't see
 Will> any problems in my build testing without it.

I think it was just the (minimal) build time advantage to not build the
unused tests.

-- 
Bye, Peter Korsgaard
