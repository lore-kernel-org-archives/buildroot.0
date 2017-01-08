From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Jan 2017 21:34:50 +0100
Subject: [Buildroot] [PATCH v3 1/1] python-arrow: new package
In-Reply-To: <1483432528-11139-1-git-send-email-david.bachelart@bbright.com>
 (David Bachelart's message of "Tue, 3 Jan 2017 09:35:28 +0100")
References: <1483432528-11139-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <87o9zhqoid.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Bachelart <david.bachelart@bbright.com> writes:

 > Signed-off-by: David Bachelart <david.bachelart@bbright.com>
 > ---
 > Changes v1 -> v2:
 >   - download source from pypi.python.org
 >   - use MD5 sum from upstream in hash file

 > Changes v2 -> v3:
 >   - use ./support/scripts/scanpypi arrow to create package (suggestion from Yegor Yefremov)
 >   - fix missing dot in package description (suggestion from Yegor Yefremov)
 >   - remove sha1 sum in hash file (suggestion from Yegor Yefremov)

Committed, thanks.

-- 
Bye, Peter Korsgaard
