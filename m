From: Christian Stewart <christian@paral.in>
Date: Sat, 30 Apr 2016 08:42:34 +0000
Subject: [Buildroot] [PATCH v2 3/3] aufs-util: new package
In-Reply-To: <1461936744-1528-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
References: <1461936744-1528-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
Message-ID: <1462005755169-4ae010c1-772a9f1f-c4a5bd2a@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All, Atul,
On Fri, Apr 29, 2016 at 9:32 AM Atul Singh
<atul.singh.mandla@rockwellcollins.com> wrote: > [Atul:
> - Updated the default to empty.
> - Updated the license to GPLv2.
> - Used patches instead of SED commands.
> - CC and LD are replaced by TARGET_CC and TARGET_LD.
Thank you very much for picking this up. Aufs support is somewhat critical to my
ongoing docker engine work. My old patches are working well enough to use Aufs
with Docker-Engine v1.11.1, however, your fixes should make the series suitable
for merging upstream. This will open up a path for me to merge my docker engine
series, hopefully soon.
Thanks! ~ Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160430/4784e5fd/attachment-0001.html>
