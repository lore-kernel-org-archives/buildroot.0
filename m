From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Dec 2016 11:14:40 +0100
Subject: [Buildroot] [PATCH] stunnel: fix static link
In-Reply-To: <ca7b0588b4175ace369af46ded807fd088ae310f.1482606642.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 24 Dec 2016 21:10:42 +0200")
References: <ca7b0588b4175ace369af46ded807fd088ae310f.1482606642.git.baruch@tkos.co.il>
Message-ID: <87eg0td6gf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > zlib is a dependency of OpenSSL. Take that into account when linking
 > statically.

 > Fixes:
 > http://autobuild.buildroot.net/results/dfe/dfe7c82c7976912378e33e03ea4c677bee6a778d/
 > http://autobuild.buildroot.net/results/48c/48cb55428613e91abfe8e71456182082d9eabb75/
 > http://autobuild.buildroot.net/results/810/81029efad8b9e2f48c26a7b20f62c90844fc86df/

 > and many more.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
