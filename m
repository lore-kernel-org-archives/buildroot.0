From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Oct 2014 13:25:48 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: external 3.17 headers typo
	fix
In-Reply-To: <1412852341-38481-1-git-send-email-kaszak@gmail.com> (Karoly
 Kasza's message of "Thu, 9 Oct 2014 12:59:01 +0200")
References: <1412852341-38481-1-git-send-email-kaszak@gmail.com>
Message-ID: <874mvdbi2r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Karoly" == Karoly Kasza <kaszak@gmail.com> writes:

 > Commit 2d312b7b61c98716535513a2743a85d4d7e8a084 had a typo
 > "." instead of "_" in BR2_TOOLCHAIN_HEADERS_AT_LEAST_3.17.
 > This made selecting 3.17 as custom external headers version
 > impossible.

 > Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
