From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:39:54 +0100
Subject: [Buildroot] [PATCH] package/php: security bump to version 7.3.3
In-Reply-To: <20190312151029.24382-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 12 Mar 2019 16:10:29 +0100")
References: <20190312151029.24382-1-peter@korsgaard.com>
Message-ID: <87zhpilxgl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > php-7.3.3 fixes a number of security issues (no CVE known, bugtracker issues
 > not yet public): https://secure.php.net/ChangeLog-7.php#7.3.3

 > Drop 0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch as the
 > flock detection has been removed since commit 9222702633 (Avoid dependency
 > on "struct flock" fields order.)

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

For 2018.02.x and 2018.11.x I will instead bump to version 7.2.16.

-- 
Bye, Peter Korsgaard
