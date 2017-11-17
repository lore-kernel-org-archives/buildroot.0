From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Nov 2017 10:32:15 +0100
Subject: [Buildroot] [PATCH 1/2] qt5webkit: correct download URL and
 hash for 5.6 variant
In-Reply-To: <20171116142305.29500-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 16 Nov 2017 15:23:04 +0100")
References: <20171116142305.29500-1-peter@korsgaard.com>
Message-ID: <87lgj59rog.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit 06a4975d4bd03 (qt5: bump LTS version to 5.6.3) added an empty hash
 > for the 5.6.3 variant of qt5webkit, causing failures.

 > It also forgot to adjust the download URL as the qt5webkit tarballs are no
 > longer available under official_releases/ like the other submodules, but only
 > under community_releases/.

 > Fix both issues.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
