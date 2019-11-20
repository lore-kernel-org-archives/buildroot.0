From: Michael Walle <michael@walle.cc>
Date: Wed, 20 Nov 2019 10:21:12 +0100
Subject: [Buildroot] [PATCH 1/9] package/rcw: upgrade the rcw version to
 LSDK-19.09
In-Reply-To: <20191120040725.32207-2-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-2-jerry.huang@nxp.com>
Message-ID: <8ef6b0156f54102d837ecfc429ae810d@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2019-11-20 05:07, schrieb Changming Huang:
> Change the RCW version to LSDK-19.09.
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
>  package/rcw/rcw.hash | 3 +--
>  package/rcw/rcw.mk   | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
> index 7de1ec659a..3fbb5d167f 100644
> --- a/package/rcw/rcw.hash
> +++ b/package/rcw/rcw.hash

sorry for missing the initial commit.. but IMHO the package name "rcw" 
is _really_ bad. because its too generic. what if another SoC also has a 
package rcw. So if it is still possible, could it be renamed to 
rcw-qoriq ?

-michael
