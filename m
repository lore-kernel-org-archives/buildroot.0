From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 10:50:19 +0100
Subject: [Buildroot] [PATCH v2] package/python-tornado: only available
 for Python 3
In-Reply-To: <20191007203731.29166-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Mon, 7 Oct 2019 22:37:31 +0200")
References: <20191007203731.29166-1-arnout@mind.be>
Message-ID: <874kzt8ahw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Since the bump to 6.0.1, python-tornado has dropped support for Python 2
 > and now needs Python >= 3.5 (cfr. setup.cfg).

 > Apparently this is not checked by setuptools, and apparently
 > byte-compile is not done in the autobuilders, so there's not autobuild
 > failure.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Asaf Kahlon <asafka7@gmail.com>
 > Cc: Ryan Barnett <ryan.barnett@rockwellcollins.com>
 > Cc: Yegor Yefremov <yegorslists@googlemail.com>
 > --
 > v2: also update reverse dependencies (Thomas)

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
