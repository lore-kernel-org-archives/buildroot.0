From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 May 2021 09:48:36 +0200
Subject: [Buildroot] [PATCH 1/2] boot/opensbi: move patches to 0.9/
 subdir to only apply when the 0.9 version is selected
In-Reply-To: <20210512084104.26689-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 12 May 2021 10:41:02 +0200")
References: <20210512084104.26689-1-peter@korsgaard.com>
Message-ID: <875yznjcq3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > With the addition of support for custom opensbi version in commit
 > 5c7166d387b (boot/opensbi: add support for version configuration), we can no
 > longer be sure that the Buildroot patches can be applied - So move them to a
 > 0.9 subdir to ensure they are only applied when the _LATEST_VERSION is used.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
