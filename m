From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 22:54:35 +0100
Subject: [Buildroot] [PATCH] linux-headers: drop old unsupported 3.x
 versions
In-Reply-To: <20180129214825.8469-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 29 Jan 2018 22:48:25 +0100")
References: <20180129214825.8469-1-peter@korsgaard.com>
Message-ID: <87zi4w2uw4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > These versions are very old and no longer supported according to
 > https://www.kernel.org/category/releases.html, so drop them and add legacy
 > entries.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

3.2.x and 4.1.x are also becoming EOL in May, E.G. early in the 2018.02
LTS support cycle, should we remove those as well before 2018.08?

What about 4.10/11/12/13.x that are also not supported any more?

-- 
Bye, Peter Korsgaard
