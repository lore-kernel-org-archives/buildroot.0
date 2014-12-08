From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 21:39:16 +0100
Subject: [Buildroot] [PATCH 1/2] libinput: bump version to 0.7.0
In-Reply-To: <1418067428-20116-1-git-send-email-ps.report@gmx.net>
References: <1418067428-20116-1-git-send-email-ps.report@gmx.net>
Message-ID: <20141208213916.1bb746c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Mon,  8 Dec 2014 20:37:07 +0100, Peter Seiderer wrote:
> See [1] for a detailed list of changes.
> 
> Additional renamed (and rebased) the single patch.
> 
> [1] http://lists.freedesktop.org/archives/wayland-devel/2014-December/018750.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../0001-rename-log_msg-to-libinput_log_msg.patch  | 63 ++++++++++++++++++++
>  ...put-01-rename-log_msg-to-libinput_log_msg.patch | 67 ----------------------
>  package/libinput/libinput.mk                       |  2 +-
>  3 files changed, 64 insertions(+), 68 deletions(-)
>  create mode 100644 package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
>  delete mode 100644 package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
