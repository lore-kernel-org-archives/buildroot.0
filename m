From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 13:52:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbuffer: bump to version
 20200505
In-Reply-To: <20200508142639.1586652-1-fontaine.fabrice@gmail.com>
References: <20200508142639.1586652-1-fontaine.fabrice@gmail.com>
Message-ID: <20200509135202.528f2eb9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 May 2020 16:26:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix a build failure with gcc 4.8
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1a7fe7ac8cbe9997bc5d1e9ade24bc2ee6ac6abe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mbuffer/mbuffer.hash | 4 ++--
>  package/mbuffer/mbuffer.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Since it fixes a build issue, I've applied to master. Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
