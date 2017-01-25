From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 22:38:03 +0100
Subject: [Buildroot] [PATCH] python-jinja2: bump to version 2.9.4
In-Reply-To: <20170125141658.1626-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Wed, 25 Jan 2017 15:16:58
 +0100")
References: <20170125141658.1626-1-yegorslists@googlemail.com>
Message-ID: <877f5ig6ro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > While bumping fix async feature related issue:

 > Both asyncsupport.py and asyncfilters.py use async feature, that is
 > not available in Python 2 and some features available in Python 3.6.
 > So in both cases *.py compilation would produce compiler errors.
 > Hence remove both files after package extraction.

Committed, thanks.

-- 
Bye, Peter Korsgaard
