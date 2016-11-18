From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 12:38:05 +0100
Subject: [Buildroot] [PATCH v2 03/15] reproducible: add '-n' to gzip
 invocations
In-Reply-To: <1479460224-6119-4-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-4-git-send-email-jezz@sysmic.org>
Message-ID: <20161118123805.7e0645ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 10:10:12 +0100, J?r?me Pouiller wrote:
> Default invocation to gzip include timestamp in output file. This feature is
> incompatible with BR2_REPRODUCIBLE. It is possible to disable it with '-n'.
> 
> The environment variable GZIP can hold a set of default options for gzip. So
> instead to find all gzip invocation in build process, we just export 'GZIP=-n'.
> 
> Notice bzip2, lzma and xz are impacted by this problem. On the other hand, lzop
> include timestamp and does not provide any way to disable it.
> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

If nobody complains about this patch, I'm going to apply it to the next
branch soon.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
