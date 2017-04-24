From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:18:24 +0200
Subject: [Buildroot] [PATCH] pkg-python: ignore user site-packages
	directory
In-Reply-To: <20170406184608.22111-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Thu, 6 Apr 2017 20:46:08
 +0200")
References: <20170406184608.22111-1-yegorslists@googlemail.com>
Message-ID: <87pog1y5q7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > According to PEP 370 Python will also search for the packages in the
 > user site-packages directory. This can affect build reproducibility.

 > The solution is to use PYTHONNOUSERSITE=1 for all Python packages,
 > i.e. both host and target variants.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
