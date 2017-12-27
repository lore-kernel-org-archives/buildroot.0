From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:36:29 +0100
Subject: [Buildroot] [PATCH v3] package/mfgtools: bump to 0.02
In-Reply-To: <20171226131921.8312-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 26 Dec 2017 14:19:21 +0100")
References: <20171226131921.8312-1-romain.naour@gmail.com>
Message-ID: <87r2rfn6he.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Bump mfgtools to include the fix [1] for the C++ build issue reported
 > by the autobuilders.

 > This bump include only 4 small commit fixing memory leak and this
 > build issue.

 > Remove CPOL.htm (removed upstream) from MFGTOOLS_LICENSE_FILES but CPOL
 > license is still valid.
 > Add the README.txt file to MFGTOOLS_LICENSE_FILES since it contains
 > licensing informations:

 > Licenses:
 > - CPOL: MfgToolLib/XmlLite.CPP and XmlLite.h
 > - BSD: Others.

 > Add license file hash.

 > [1] https://github.com/codeauroraforum/mfgtools/commit/b370a43e548440025d274ff2abbb25342bbaa78c

 > Fixes:
 > http://autobuild.buildroot.net/results/7c2bbbe13ab315684f3502afd96958a76879b1d5

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Gary Bisson <gary.bisson@boundarydevices.com>
 > ---
 > This patch should be backported to stable branches 2017.02 and 2017.08.

 > v3: update url in Config.in.host (Gary)
 > v2: update url (Baruch)
 >     add README.txt to MFGTOOLS_LICENSE_FILES (Baruch)

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
