From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jun 2019 21:56:07 +0200
Subject: [Buildroot] [PATCH] package/icu: adjust version information
In-Reply-To: <20190624042333.1946-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 24 Jun 2019 06:23:33 +0200")
References: <20190624042333.1946-1-thomas.petazzoni@bootlin.com>
Message-ID: <8736jxigmg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The icu upstream developers have a strange way of labelling their versions:
 >  - The Github tags are named release-XX-Y, and therefore the versions
 >    referenced by by Release Monitoring look like 60-2 or 64-1.

 >  - The tarballs contain the version with an underscore separator, i.e
 >    60_2 or 64_1.

 >  - The directories on http://download.icu-project.org/files/icu4c/
 >    contain the version with a dot separator, i.e 60.2 or 64.1.

 > In order to have our <pkg>_VERSION match the one on Release
 > Monitoring, we adjust it to use the underscore separator, and then
 > further tweak the ICU_SOURCE and ICU_SITE definitions to keep
 > everything working.

Sigh, what a mess! Committed, thanks.

-- 
Bye, Peter Korsgaard
