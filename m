From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 11:27:34 +0200
Subject: [Buildroot] [PATCH-2020.02.x] package/cryptsetup: add upstream
 patch to fix runtime issue with json-c >= 0.14.0
In-Reply-To: <20201011210738.22951-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 11 Oct 2020 23:07:37 +0200")
References: <20201011210738.22951-1-peter@korsgaard.com>
Message-ID: <878scbssjd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes #13251
 > json-c >= 0.14.0 has a name clash with internal cryptsetup functions,
 > causing a runtime issue.  Backport an upstream patch to rename the internal
 > functions to fix this.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
