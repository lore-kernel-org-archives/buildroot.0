From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:12:43 +0200
Subject: [Buildroot] [PATCH 1/1 v3] json-c: bump version to
 json-c-0.12-20140410
In-Reply-To: <1429089688-4106-1-git-send-email-sagaert.johan@proximus.be>
References: <1429089688-4106-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <20150416081243.700910ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed, 15 Apr 2015 11:21:28 +0200, Sagaert Johan wrote:
> Also;
>   -removed upstream patch
>   -added patch to remove -Werror from make flags
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
> ---
> V2->V3
> 	no hash for git checkouts
> 	add comment to AUTORECONF line.
> ---
> V1->V2
> 	Remove the -Werror from make flags
> ---
>  .../0001-don-t-threat-warnings-as-errors.patch     | 21 +++++++++++
>  package/json-c/0001-no-reentrant.patch             | 44 ----------------------
>  package/json-c/json-c.mk                           |  4 +-
>  3 files changed, 24 insertions(+), 45 deletions(-)
>  create mode 100644 package/json-c/0001-don-t-threat-warnings-as-errors.patch
>  delete mode 100644 package/json-c/0001-no-reentrant.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
