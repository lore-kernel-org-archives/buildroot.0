From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Jan 2019 17:47:46 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] Update for 2018.11.2
In-Reply-To: <20190130161532.4xw5yhc2zdhadz77@sapphire.tkos.co.il> (Baruch
 Siach's message of "Wed, 30 Jan 2019 18:15:32 +0200")
References: <20190130153958.16876815F5@busybox.osuosl.org>
 <20190130161532.4xw5yhc2zdhadz77@sapphire.tkos.co.il>
Message-ID: <87tvhqytvx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Wed, Jan 30, 2019 at 04:40:52PM +0100, Peter Korsgaard wrote: 
 >> diff --git a/Makefile b/Makefile
 >> index 998b571071..6379d069d4 100644
 >> --- a/Makefile
 >> +++ b/Makefile
 >> @@ -92,7 +92,7 @@ all:
 >> .PHONY: all
 >> 
 >> # Set and export the version string
 >> -export BR2_VERSION := 2018.11.1
 >> +export BR2_VERSION := 2018.11.2
 >> # Actual time the release is cut (for reproducible builds)
 >> BR2_VERSION_EPOCH = 1545257000

 > What about BR2_VERSION_EPOCH update?

Crap. I _DID_ change it, but forgot to save the file :/

diff --git a/Makefile b/Makefile
index 6379d069d4..2270aa7c09 100644
--- a/Makefile
+++ b/Makefile
@@ -94,7 +94,7 @@ all:
 # Set and export the version string
 export BR2_VERSION := 2018.11.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1545257000
+BR2_VERSION_EPOCH = 1548863000

I guess the best solution is just to forget about the epoch for this
release :/

-- 
Bye, Peter Korsgaard
