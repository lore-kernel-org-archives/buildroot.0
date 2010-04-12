From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Apr 2010 19:55:41 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	br2-recent-removal
In-Reply-To: <cover.1271078939.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 12 Apr 2010 15:31:36 +0200")
References: <cover.1271078939.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878w8sk12a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a new try for the BR2_RECENT configuration option
 Thomas> removal. Instead of converting all entries marked BR2_RECENT into
 Thomas> BR2_DEPRECATED entries (which would make them disappear in the default
 Thomas> Buildroot configuration), we just get rid of BR2_RECENT *and*
 Thomas> BR2_DEPRECATED on these entries. Therefore, they still appear in the
 Thomas> default Buildroot configuration, and we can then later decide, on a
 Thomas> per-entry basis, whether they should be marked BR2_DEPRECATED or not.

Pulled and pushed, thanks!

-- 
Bye, Peter Korsgaard
