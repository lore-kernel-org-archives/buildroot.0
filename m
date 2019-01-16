From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 09:30:55 +0100
Subject: [Buildroot] [PATCH] docs/manual: standardize a bit more the
 formatting of commit titles
In-Reply-To: <20181124101903.18138-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Nov 2018 11:19:03 +0100")
References: <20181124101903.18138-1-thomas.petazzoni@bootlin.com>
Message-ID: <87muo1ovgg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Currently, our commit titles are not very well standardized, and it
 > would be great to standardize them a little bit more. A number of
 > people use "<pkg>: " as prefix, others use "package/<pkg>: ". Some
 > people start the rest of the commit title (after the prefix) with an
 > upper-case letter, some with a lower-case letter.

 > In an attempt to standardize this, this commit updates the manual with
 > some examples of good commit titles.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

We had some discussion if this is the best format to use, but it is
largely a matter of personal preferences, and having a documented
standard is better than none.

So committed, thanks.

-- 
Bye, Peter Korsgaard
