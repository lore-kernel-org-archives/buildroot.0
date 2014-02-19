From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 09:32:02 +0100
Subject: [Buildroot] Switching from uClibc to glibc as the default in
	Buildroot?
In-Reply-To: <20140219092112.6f359a55@skate> (Thomas Petazzoni's message of
 "Wed, 19 Feb 2014 09:21:12 +0100")
References: <20140218231447.524a1a20@skate>
 <CAMKF1soCcLba_EacJLe7f9fM9=gFsTJYj0kaz6YzoXzEY1rx2A@mail.gmail.com>
 <fd7802bd-3f37-4d70-ad22-2e46fc452b4b@email.android.com>
 <66DCE5C2-E7A6-4634-8C79-441DA9FC46FB@gmail.com>
 <20140219092112.6f359a55@skate>
Message-ID: <87y5171p19.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Khem Raj,
 > On Tue, 18 Feb 2014 18:43:41 -0800, Khem Raj wrote:

 >> > There are a great number of fixes since the last numbered release and I for one would greatly appreciate having at least a "testing" release with a bumped version number to use. Other than the ldso stat call problem I reported a couple of weeks ago, uClibc trunk has been working fairly well, and most bugs I run into are the typical growing pains of toolchain building from scratch rather than uClibc problems.
 >> 
 >> so get going start testing git/master and report issues or successes you have.
 >> help in testing it out, run uclibc test suites or any others you have setups for

 > Please break the chicken-and-egg problem, and release 2014.02-rc1 right
 > now, spit out a call for testing, and release 2014.02 at the end of the
 > month. (Or pick any other date you want, those are just suggestions).

Inded. When Bernard suggested the same last year I did test and reported
issues, but never got any reply:

http://lists.uclibc.org/pipermail/uclibc/2013-November/048093.html

-- 
Bye, Peter Korsgaard
