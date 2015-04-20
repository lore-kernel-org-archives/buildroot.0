From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 22:38:16 +0200
Subject: [Buildroot] [PATCH] package/gdb: backport xtensa gdbserver fixes
In-Reply-To: <1429446912-3366-1-git-send-email-jcmvbkbc@gmail.com>
References: <1429446912-3366-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150420223816.285de98b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sun, 19 Apr 2015 15:35:12 +0300, Max Filippov wrote:
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...gdbserver-xtensa-drop-xtensa_usrregs_info.patch | 47 ++++++++++++++++++++++
>  ...erver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch | 46 +++++++++++++++++++++
>  ...gdbserver-xtensa-drop-xtensa_usrregs_info.patch | 47 ++++++++++++++++++++++
>  ...erver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch | 46 +++++++++++++++++++++
>  4 files changed, 186 insertions(+)
>  create mode 100644 package/gdb/7.8.2/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
>  create mode 100644 package/gdb/7.8.2/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
>  create mode 100644 package/gdb/7.9/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
>  create mode 100644 package/gdb/7.9/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
