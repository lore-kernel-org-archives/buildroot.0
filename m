From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 May 2015 23:27:39 +0200
Subject: [Buildroot] [PATCH] gcc: fix PR 65730 (ICE on xtensa cores w/o
 hardware multiplication)
In-Reply-To: <1432152037-6346-1-git-send-email-jcmvbkbc@gmail.com>
References: <1432152037-6346-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150520232739.72294f84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Wed, 20 May 2015 23:00:37 +0300, Max Filippov wrote:
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/gcc/4.7.4/111-pr65730.patch | 37 +++++++++++++++++++++++++++++++++++++
>  package/gcc/4.8.4/111-pr65730.patch | 37 +++++++++++++++++++++++++++++++++++++
>  package/gcc/4.9.2/111-pr65730.patch | 37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 111 insertions(+)
>  create mode 100644 package/gcc/4.7.4/111-pr65730.patch
>  create mode 100644 package/gcc/4.8.4/111-pr65730.patch
>  create mode 100644 package/gcc/4.9.2/111-pr65730.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
