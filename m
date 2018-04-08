From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 21:42:07 +0200
Subject: [Buildroot] [PATCH 2/2] python-webpy: security bump to version
 0.39
In-Reply-To: <20180404155132.17500-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 4 Apr 2018 17:51:32 +0200")
References: <20180404155132.17500-1-peter@korsgaard.com>
 <20180404155132.17500-2-peter@korsgaard.com>
Message-ID: <87o9ita3jk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the changelog:
 > 2018-02-28 0.39
 > * Fixed a security issue with the form module (tx Orange Tsai)
 > * Fixed a security issue with the db module (tx Adri?n Brav and Orange Tsai)

 > 2016-07-08 0.38
 > ..
 > * Fixed a potential remote exeution risk in `reparam` (tx Adri?n Brav)

 > License files are still not included on pypi, so continue to use the git
 > repo. Upstream has unfortunately not tagged 0.39, so use the latest commit
 > on the 0.39 branch.  A request to fix this has been submitted:

 > https://github.com/webpy/webpy/issues/449

 > 0.39 now uses setuptools, so change the _SETUP_TYPE.

 > Add hashes for the license files.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
