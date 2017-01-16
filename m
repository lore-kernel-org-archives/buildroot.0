From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:15:46 +0100
Subject: [Buildroot] [PATCH] jasper: disable PDF documentation generation
In-Reply-To: <b17e9f42b1d2e17bb543c9d5b3b17e80a95c38d0.1484417309.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 14 Jan 2017 20:08:29 +0200")
References: <b17e9f42b1d2e17bb543c9d5b3b17e80a95c38d0.1484417309.git.baruch@tkos.co.il>
Message-ID: <87a8arfbf1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > We don't need the PDF document on target. This also avoids incompatible host
 > Latex packages.

 > Fixes:
 > http://autobuild.buildroot.net/results/e60/e60c4a71a08aebadd0bc3fb95a57a4a223e4b6fa/
 > http://autobuild.buildroot.net/results/4ec/4ec8a1735590a3cad4b74630b4b6bdd2e3a7eec8/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed after reformatting as suggested by Yann, thanks.

-- 
Bye, Peter Korsgaard
