From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 08:53:52 +0200
Subject: [Buildroot] [PATCH] scanpypi: add support for the new PyPI
 infrastructure
In-Reply-To: <20180418095542.22608-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Wed, 18 Apr 2018 11:55:42
 +0200")
References: <20180418095542.22608-1-yegorslists@googlemail.com>
Message-ID: <871sevoohr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > https://pypi.python.org URL has been changed to https://pypi.org.

 > Package's JSON object now contains sha256 checksum, so use it
 > instead of locally computed one. Change comments in the hash
 > file accordingly.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
