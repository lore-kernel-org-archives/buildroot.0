From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:49:16 +0100
Subject: [Buildroot] [PATCH v4 03/18] reproducible: add '-n' to gzip
 invocations
In-Reply-To: <1479905937-17241-4-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
 <1479905937-17241-4-git-send-email-jezz@sysmic.org>
Message-ID: <20161123224916.12aab604@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 13:58:42 +0100, J?r?me Pouiller wrote:
> Default invocation to gzip include timestamp in output file. This feature is
> incompatible with BR2_REPRODUCIBLE. It is possible to disable it with '-n'.
> 
> The environment variable GZIP can hold a set of default options for gzip. So
> instead to find all gzip invocation in build process, we just export 'GZIP=-n'.
> 
> Notice bzip2, lzma and xz are not impacted by this problem. On the other hand, lzop
> does include timestamp and does not provide any way to disable it.
> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
