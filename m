From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 22:48:56 +0200
Subject: [Buildroot] [PATCH] utils/getdeveloperlib.py: print
 warnings/errors to stderr
In-Reply-To: <20190404065812.22601-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 4 Apr 2019 08:58:12 +0200")
References: <20190404065812.22601-1-peter@korsgaard.com>
Message-ID: <87d0m0npon.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Instead of stdout where it gets mixed with the normal output, confusing
 > software parsing the output (E.G. get-developers -e as git sendemail.ccCmd).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
