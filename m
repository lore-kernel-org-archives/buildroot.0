From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 May 2013 11:55:15 +0200
Subject: [Buildroot] legal-info too permissive?
In-Reply-To: <20130514114131.0b73cee0@skate> (Thomas Petazzoni's message of
 "Tue, 14 May 2013 11:41:31 +0200")
References: <20130514114131.0b73cee0@skate>
Message-ID: <87r4h9sx6k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> In this intentional? Shouldn't 'make legal-info' be more
 Thomas> restrictive, and bail out with an error if some license file
 Thomas> cannot be found in the source code? At least the latter would
 Thomas> be the most useful behavior for the autobuilders.

I agree.

-- 
Bye, Peter Korsgaard
