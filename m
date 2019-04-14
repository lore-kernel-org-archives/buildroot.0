From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 20:08:10 +0200
Subject: [Buildroot] [PATCH v8 0/9] Package CPE Reporting
In-Reply-To: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5759a010-4340-647b-677c-fa6e0827a5bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/03/2019 23:04, Matt Weber wrote:
> Some existing
> fix-ups forthe CPE strings can be found in the following commit that
> eventually needs to be split up and applied.
> 
> https://github.com/rc-matthew-l-weber/buildroot/commit/8ce8d4740b95672d8390799b611a35ea18a543e0

 I don't really think it needs to be split up. Only if it would touch more than
100 packages it might be better to split it up in chunks of 50-ish packages.

 Regards,
 Arnout
