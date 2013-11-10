From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 00:12:51 +0100
Subject: [Buildroot] [PATCH 0 of 4 v2] Add POST_RSYNC hook
In-Reply-To: <patchbomb.1383820880@argentina> (Thomas De Schampheleire's
 message of "Thu, 07 Nov 2013 11:41:20 +0100")
References: <patchbomb.1383820880@argentina>
Message-ID: <877gcfc0lo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

> This patch series adopts the POST_RSYNC hook patch by Tzu-Jung Lee and
> changes the default rsync exclusion list, as discussed on the Buildroot
> developer days.
> The other rsync-related patch submitted by Tzu-Jung Lee (custom rsync
> command) should not be needed anymore as its use case is covered by
> the second patch in this series.

> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed series, thanks.

-- 
Bye, Peter Korsgaard
