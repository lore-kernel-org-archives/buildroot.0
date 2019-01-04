From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Jan 2019 08:34:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to v8.15.0
In-Reply-To: <20190103144423.14883-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 3 Jan 2019 15:44:22 +0100")
References: <20190103144423.14883-1-peter@korsgaard.com>
 <20190103144423.14883-2-peter@korsgaard.com>
Message-ID: <87va34naew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes regressions introduced by the v8.14.0 security release.  From the
 > announcement:

 > The 8.14.0 security release introduced some unexpected breakages on the 8.x
 > release line.  This is a special release to fix a regression in the HTTP
 > binary upgrade response body and add a missing CLI flag to adjust the max
 > header size of the http parser.

 > https://github.com/nodejs/node/blob/master/doc/changelogs/CHANGELOG_V8.md#8.15.0

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
