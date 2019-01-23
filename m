From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 15:33:03 +0100
Subject: [Buildroot] [PATCH] rauc: target rauc needs unsquashfs at
 runtime
In-Reply-To: <20181230224246.31d700d2@windsurf> (Thomas Petazzoni's message of
 "Sun, 30 Dec 2018 22:42:46 +0100")
References: <20181217221500.7317-1-tpiepho@impinj.com>
 <20181230224246.31d700d2@windsurf>
Message-ID: <87imyfla00.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 17 Dec 2018 22:15:19 +0000, Trent Piepho wrote:
 >> In order to provide info about a bundle file, e.g. running "rauc info
 >> bundle.raucb", rauc needs to use the unsquashfs progam from the squashfs
 >> package.
 >> 
 >> This was not documented until upstream commit 10c501c12752 ("docs:
 >> integration: document need for 'unsquashfs' tool for 'rauc info'"), but
 >> is already present in rauc.
 >> 
 >> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
 >> ---
 >> package/rauc/Config.in | 1 +
 >> 1 file changed, 1 insertion(+)

 > Applied to master, thanks.

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
