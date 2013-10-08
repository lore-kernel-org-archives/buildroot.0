From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 15:26:26 +0200
Subject: [Buildroot] [PATCH] Fix compilation of busybox 1.21.1
In-Reply-To: <1381238186-24937-1-git-send-email-jezz@sysmic.org>
References: <1381238186-24937-1-git-send-email-jezz@sysmic.org>
Message-ID: <20131008152626.7217c920@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  8 Oct 2013 15:16:26 +0200, J?r?me Pouiller wrote:
> It seems patches previously applied on busybox 1.20.2 are also needed
> for version 1.21.1.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---  
>  .../busybox/1.21.1/busybox-1.21.1-kernel_ver.patch |   25 ++++
>  package/busybox/1.21.1/busybox-1.21.1-ntpd.patch   |   11 ++

Those two patches lack the description + Signed-off-by.

The first patch is 556ac3633ce3e7bd51c93b78827ae3874d856257 upstream,
and the second patch is b7841cf7b919b16d1bd4619154bf7cb4c22b4ccd.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
