From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Nov 2015 12:37:37 +0100
Subject: [Buildroot] [PATCH v2 1/2] rpcbind: backport adjustment to
 changes in libtirpc 1.0.1
In-Reply-To: <1448401554-16331-2-git-send-email-peda@lysator.liu.se>
References: <1448401554-16331-1-git-send-email-peda@lysator.liu.se>
 <1448401554-16331-2-git-send-email-peda@lysator.liu.se>
Message-ID: <20151125123737.19b67bff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Rosin,

On Tue, 24 Nov 2015 22:45:52 +0100, Peter Rosin wrote:
> From: Peter Rosin <peda@axentia.se>
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  ...ly-Don-t-use-the-xp_auth-pointer-directly.patch |   42 ++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/rpcbind/0002-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch

Both patches applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
