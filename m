From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 09:11:19 +0200
Subject: [Buildroot] [PATCH] package/syslog-ng: bump version to 3.24.1
In-Reply-To: <20191014082132.11049-1-judge.packham@gmail.com>
References: <20191014082132.11049-1-judge.packham@gmail.com>
Message-ID: <20191015091119.0bdc14f0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 21:21:32 +1300
Chris Packham <judge.packham@gmail.com> wrote:

> Drop patch applied upstream.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  ...plicit-un-initialized-state-to-Windo.patch | 118 ------------------
>  package/syslog-ng/syslog-ng.conf              |   2 +-
>  package/syslog-ng/syslog-ng.hash              |   2 +-
>  package/syslog-ng/syslog-ng.mk                |   2 +-
>  4 files changed, 3 insertions(+), 121 deletions(-)
>  delete mode 100644 package/syslog-ng/0002-logsource-add-explicit-un-initialized-state-to-Windo.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
