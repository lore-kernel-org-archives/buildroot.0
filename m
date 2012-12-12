From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Dec 2012 07:05:39 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <NDBBKLDECLOIHFJKBINAIEFOFPAA.Berns@BEKA-Elektronik.de>
 (Berns@beka-elektronik.de's message of "Tue, 11 Dec 2012 10:30:42
 +0100")
References: <NDBBKLDECLOIHFJKBINAIEFOFPAA.Berns@BEKA-Elektronik.de>
Message-ID: <87lid3ole4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Berns" == Berns  <Berns@BEKA-Elektronik.de> writes:

 Berns> I changed from gcc 4.6.X to gcc 4.5.X and now it works.
 Berns> Maybe it's an isue with ubuntu 12.04 and gcc 4.6.X.

Ok, interesting. I don't find anything specific about any largefile
changes in 12.04, but will try to find time to install it in a vm to
have a look.

Could you perhaps put the entire (compressed) failing build log online
somewhere so I can have a look?

E.G.:

make >log.txt 2>&1
bzip2 log.txt

-- 
Bye, Peter Korsgaard
