From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Feb 2018 13:44:34 +0100
Subject: [Buildroot] [PATCH-2017.11.x] refpolicy: add upstream patch
 fixing compile error related to implicit-fallthrough
In-Reply-To: <20180205224213.2036-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 5 Feb 2018 23:42:13 +0100")
References: <20180205224213.2036-1-peter@korsgaard.com>
Message-ID: <87h8quthhp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/958/958ff318cdbedb5b8641b376223491b85a75f084/
 > http://autobuild.buildroot.net/results/54e/54e240243aba31da33a2cbecdcc234b44f24dcf7/

 > fc-sort is a host utility compiled with -Werror, and for modern (>= 7.x) gcc
 > versions, Werror implies -Werror=implicit-fallthrough.

 > And an upstream patch fixing this issue.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
