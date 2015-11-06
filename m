From: Peter Rosin <peda@lysator.liu.se>
Date: Fri, 06 Nov 2015 09:27:03 +0100
Subject: [Buildroot] [PATCH 1/2] rpcbind: backport adjustment to changes
 in libtirpc 1.0.1
In-Reply-To: <1446712210-14129-2-git-send-email-peda@lysator.liu.se>
References: <1446712210-14129-1-git-send-email-peda@lysator.liu.se>
 <1446712210-14129-2-git-send-email-peda@lysator.liu.se>
Message-ID: <563C6457.8070006@lysator.liu.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 2015-11-05 09:30, Peter Rosin wrote:
> From: Peter Rosin <peda@axentia.se>
>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  ...ly-Don-t-use-the-xp_auth-pointer-directly.patch |   42 ++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100755 package/rpcbind/0002-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
>
> diff --git a/package/rpcbind/0002-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch b/package/rpcbind/0002-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
> new file mode 100755

Ouch, should be file mode 100644.

Should I resend a -v2 series fixing this glitch?

Cheers,
Peter
