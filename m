From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:08:33 +0200
Subject: [Buildroot] [git commit] package/xerces: fix typo,
 which re-enables package
In-Reply-To: <20200913132235.B073B8A4B1@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 13 Sep 2020 15:30:24 +0200")
References: <20200913132235.B073B8A4B1@busybox.osuosl.org>
Message-ID: <87v9geud3y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6e61a4ce04fee1613eea9b703348c15906de9013
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 4e60247be67a8e7f9937a8bf2b123ddb2be9dad2 ("package/xerces: fix
 > coding style in Config.in") introduced a silly typo in the xerces
 > package depends on... which effectively made it impossible to enable
 > this package as the "USE_WCHAR" option does not exist.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
