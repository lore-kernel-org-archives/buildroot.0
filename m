From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2020 17:36:21 +0200
Subject: [Buildroot] [git commit] package/cups: add proper init script
In-Reply-To: <20200804205508.952708377E@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 4 Aug 2020 23:00:10 +0200")
References: <20200804205508.952708377E@busybox.osuosl.org>
Message-ID: <87o8n8ynii.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=04226ac6b7104f17f22091be8f5ce43c56abd210
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Cups service for systemv was erroneously installed in /etc/rcX.d and
 > therefore not working. Also, its init script installed in /etc/init.d
 > was definitely not a Buildroot-style init script.

 > This patch adds a Buildroot style init script instead of using the
 > example provided by the package.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
