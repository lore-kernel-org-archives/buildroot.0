From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jul 2017 21:41:54 +0200
Subject: [Buildroot] [PATCH] spice: add upstream security fixes for
	CVE-2017-7506
In-Reply-To: <20170714193046.5dedfd97@windsurf> (Thomas Petazzoni's message of
 "Fri, 14 Jul 2017 19:30:46 +0200")
References: <20170714140203.19234-1-peter@korsgaard.com>
 <20170714193046.5dedfd97@windsurf>
Message-ID: <87pod2ajr1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri, 14 Jul 2017 16:02:03 +0200, Peter Korsgaard wrote:
 >> Fixes CVE-2017-7506 - Possible buffer overflow via invalid monitor
 >> configurations.
 >> 
 >> For more details, see:
 >> https://marc.info/?l=oss-security&m=150001782924095
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> ...nect-when-receiving-overly-big-ClientMoni.patch | 75 ++++++++++++++++++++++
 >> ...integer-overflows-handling-monitor-config.patch | 31 +++++++++
 >> ...buffer-overflows-handling-monitor-configu.patch | 48 ++++++++++++++
 >> 3 files changed, 154 insertions(+)
 >> create mode 100644 package/spice/0004-reds-Disconnect-when-receiving-overly-big-ClientMoni.patch
 >> create mode 100644 package/spice/0005-reds-Avoid-integer-overflows-handling-monitor-config.patch
 >> create mode 100644 package/spice/0006-reds-Avoid-buffer-overflows-handling-monitor-configu.patch

 > Applied to master, thanks. However, you forgot to use "git format-patch
 > -N" to generate the patches, so I removed the numbering from the patch
 > titles.

Crap, indeed :/ Sorry, and thanks for fixing it!

-- 
Bye, Peter Korsgaard
