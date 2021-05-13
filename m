From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 May 2021 09:48:41 +0200
Subject: [Buildroot] [PATCH 2/2] boot/opensbi: only check/reference
 COPYING.BSD when _LATEST_VERSION is used
In-Reply-To: <20210512084104.26689-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 12 May 2021 10:41:03 +0200")
References: <20210512084104.26689-1-peter@korsgaard.com>
 <20210512084104.26689-2-peter@korsgaard.com>
Message-ID: <871rabjcpy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > With the addition of support for custom opensbi version in commit
 > 5c7166d387b (boot/opensbi: add support for version configuration), we can no
 > longer be sure that the license file name / hash will be correct in all
 > cases, so only specify COPYING.BSD when _LATEST_VERSION is used, similar to
 > how we do it for the Linux kernel.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
