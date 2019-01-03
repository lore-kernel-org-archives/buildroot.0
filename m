From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Jan 2019 22:46:09 +0100
Subject: [Buildroot] [PATCH v2] package/linux-headers: drop obsolete
 3.2.x / 4.{1, 16, 18}.x versions
In-Reply-To: <20190102135246.16616-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 2 Jan 2019 14:52:45 +0100")
References: <20190102135246.16616-1-peter@korsgaard.com>
Message-ID: <87lg41o1ni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > According to https://www.kernel.org/category/releases.html, these kernel
 > versions are no longer supported, so drop them now that we have added 4.20.x

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Changes since v1:
 > - Add Config.in.legacy entries as suggested by Thomas

Committed, thanks.

-- 
Bye, Peter Korsgaard
