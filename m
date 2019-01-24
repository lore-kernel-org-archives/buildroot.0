From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:59:23 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "utils/get-developers: make it
 callable from elsewhere than the toplevel directory"
In-Reply-To: <20190103105657.23751-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 3 Jan 2019 11:56:55 +0100")
References: <20190103105657.23751-1-peter@korsgaard.com>
Message-ID: <87d0omgw38.fsf@dell.be.48ers.dk>
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

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
