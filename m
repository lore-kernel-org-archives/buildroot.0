From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Nov 2012 02:02:58 +0100
Subject: [Buildroot] [PATCH] diffutils stdio: don't assume gets any more
In-Reply-To: <1352466130-23535-1-git-send-email-alexander@mezon.ru>
References: <1352466130-23535-1-git-send-email-alexander@mezon.ru>
Message-ID: <509DA7C2.9060304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Change the commit message into:

diffutils: fix build with glibc2.16, which doesn't declare gets()

On 11/09/12 14:02, Alexander Khryukin wrote:
>
> Signed-off-by: Alexander Khryukin<alexander@mezon.ru>
> ---
>   package/diffutils/diffutils-3.2-no-gets.patch | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 package/diffutils/diffutils-3.2-no-gets.patch
>
> diff --git a/package/diffutils/diffutils-3.2-no-gets.patch b/package/diffutils/diffutils-3.2-no-gets.patch
> new file mode 100644
> index 0000000..56ca22d
> --- /dev/null
> +++ b/package/diffutils/diffutils-3.2-no-gets.patch
> @@ -0,0 +1,21 @@
> +hack until gzip pulls a newer gnulib version
> +

  You should still add your SoB here, to indicate that you were in the
forwarding path.

  Even so,
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
