From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 22:51:41 +0100
Subject: [Buildroot] [PATCH 2/2] wget: fix static link with gnutls
In-Reply-To: <1478630202-1630-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1478630202-1630-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1478630202-1630-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20161111225141.76716c6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Nov 2016 00:06:42 +0530, Rahul Bedarkar wrote:
> When statically linking with gnutls, we get definition clash error for
> base64_encode which is also defined by gnutls.
> 
> This commit adds patch to rename base64_{encode,decode} defined in wget.
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  .../0001-utils-rename-base64_-encode-decode.patch  | 134 +++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 package/wget/0001-utils-rename-base64_-encode-decode.patch

Applied to master, thanks. Please submit the patch to the upstream wget
project. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
