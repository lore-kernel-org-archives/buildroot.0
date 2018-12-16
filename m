From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 16:17:57 +0100
Subject: [Buildroot] [PATCH] squashfs: do not force gzip support if
 lz4/xz/zstd is selected
In-Reply-To: <20181207131356.14366-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 7 Dec 2018 14:13:55 +0100")
References: <20181207131356.14366-1-peter@korsgaard.com>
Message-ID: <87zht58pqy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The logic to ensure at least one compression backend is selected was not
 > updated when lz4, xz and zstd were introduced -  Fix that.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
