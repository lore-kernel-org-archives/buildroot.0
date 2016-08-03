From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 21:18:16 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain: reduce the list of locales
	to keep by default
In-Reply-To: <1470176380-11851-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 3 Aug 2016 00:19:39 +0200")
References: <1470176380-11851-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1470176380-11851-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8737mllkzr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Our current list of locales to keep by default is "C en_US de fr". It
 > doesn't make much sense to keep "de" and "fr" more than any other
 > language. So let's keep only the "C" and "en_US" locales by default,
 > and leave it to the user to specify other locales to keep if needed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
