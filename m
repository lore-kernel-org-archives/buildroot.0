From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 14:43:32 +0100
Subject: [Buildroot] [PATCH v2] scanpypi: ignore empty elements in
 package requirements
In-Reply-To: <20180126125406.2281-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Fri, 26 Jan 2018 13:54:06
 +0100")
References: <20180126125406.2281-1-yegorslists@googlemail.com>
Message-ID: <87k1w4ivln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Depending on how setup.py reads requirements files empty elements can occur.
 > This patch takes care, that such elements will be ignored and don't crash
 > the scanpypi script.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes v1 -> v2:
 >   - remove debug print statement (Peter Korsgaard)

Committed, thanks.

-- 
Bye, Peter Korsgaard
