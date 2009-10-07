From: Michael Roth <mroth@nessie.de>
Date: Wed, 7 Oct 2009 13:15:40 +0200
Subject: [Buildroot] [PATCH 08/23] qt: remove no longer needed
	'x86x86fix' workaround
In-Reply-To: <20091007125951.764be92b@surf>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<200910071226.37310.mroth@nessie.de> <20091007125951.764be92b@surf>
Message-ID: <200910071315.48306.mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just, for information, I found a commit in the Qt-tree which looks
like it was the fix for this old problem:

	http://qt.gitorious.org/qt/qt/commit/28d2b22a940174b4e64f6fa2f5548a7832fc07e8

This commit precedes 4.5.2. So looks like that this issue got really
fixed in Qt upstream.
