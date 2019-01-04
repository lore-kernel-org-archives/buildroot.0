From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Jan 2019 13:24:03 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "utils/get-developers: make it
 callable from elsewhere than the toplevel directory"
In-Reply-To: <20190103105657.23751-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 3 Jan 2019 11:56:55 +0100")
References: <20190103105657.23751-1-peter@korsgaard.com>
Message-ID: <87imz4mx0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > This reverts commit 62d5558f76a790d1c1b3a1834f1736dc86b6e34f.
 > This actually does not work, as patches contain paths relative to the
 > toplevel directory as well.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
