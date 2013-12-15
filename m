From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 13:50:52 +0100
Subject: [Buildroot] [PATCHv2 01/36] package: introduce Python package
	infrastructure
In-Reply-To: <20131212083535.3dcca6c2@skate> (Thomas Petazzoni's message of
 "Thu, 12 Dec 2013 08:35:35 +0100")
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386793631-14026-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMLA1U-mQ76ve14MswJHiL947uhw8FiewHX_jqezzs+vsA@mail.gmail.com>
 <20131212083535.3dcca6c2@skate>
Message-ID: <87iouqwa4z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Samuel Martin,
 > (Would be good to trim down a little bit the e-mails you are replying
 > to, to keep only the relevant parts. Thanks! :-))

 > On Wed, 11 Dec 2013 23:51:10 +0100, Samuel Martin wrote:

 >> > +One variable specific to the Python infrastructure is mandatory:
 >> > +
 >> > +* +PYTHON_FOO_BUILD_TYPE+, to define which Python build system is used
 >> >
 >> s/PYTHON_FOO_BUILD_TYPE/PYTHON_FOO_SETUP_TYPE/

 > Aah, yes, indeed. I named it _BUILD_TYPE originally, but then changed
 > my mind and renamed it _SETUP_TYPE, but forgot to adjust my
 > documentation.

 > I will wait for some other comments to show up. If any, I will address
 > this one in v3. If no further comments are made, hopefully Peter can
 > fix that typo when applying the patch (which would avoid the need for
 > me to respam the list with another set of 37 patches).

Sure, committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
