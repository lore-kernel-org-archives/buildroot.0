From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:28:24 +0200
Subject: [Buildroot] [PATCH 2/4] package/thrift: fix libtool warning
In-Reply-To: <1428339450-2158-2-git-send-email-romain.naour@openwide.fr>
References: <1428339450-2158-1-git-send-email-romain.naour@openwide.fr>
 <1428339450-2158-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150406232824.75f94c32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon,  6 Apr 2015 18:57:28 +0200, Romain Naour wrote:
> Backport an upstream patch.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...-check-minimum-required-version-of-automa.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch

Applied, after taking into account Arnout's comments (hopefully
correctly).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
