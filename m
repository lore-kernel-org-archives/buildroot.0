From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 16:12:18 +0100
Subject: [Buildroot] [PATCH 1/6] support/libtool: add patch for newer
 versions
In-Reply-To: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141221161218.017f5f7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 16 Dec 2014 11:08:15 -0300, Gustavo Zacarias wrote:
> Add patch to support newer (>2.4.2) versions.
> Adjust patch logic to check for patchlevel greater than 2 (apply new patch) or
> not (apply current patch).
> Some people/distributions used unreleased versions, with the string being
> 2.4.2.x, this packages are AUTORECONFed and have to be kept like this since
> the up-to-2.4.2 patch doesn't work, neither does the from-2.4.3 version patch.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pkg-autotools.mk                       |  8 ++-
>  support/libtool/buildroot-libtool-v2.4.4.patch | 95 ++++++++++++++++++++++++++
>  2 files changed, 102 insertions(+), 1 deletion(-)
>  create mode 100644 support/libtool/buildroot-libtool-v2.4.4.patch

Entire series applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
