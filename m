From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 30 Aug 2019 17:17:53 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.24.4
In-Reply-To: <20190830120432.28131-1-aperez@igalia.com>
References: <20190830120432.28131-1-aperez@igalia.com>
Message-ID: <20190830171753.GC8338@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Fri, 30 Aug 2019 15:04:32 +0300, Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a minor release which includes fixes for CVE-2019-8644,
> CVE-2019-8649, CVE-2019-8658, CVE-2019-8669, CVE-2019-8676,
> CVE-2019-8678, CVE-2019-8680, CVE-2019-8683, CVE-2019-8684, and
> CVE-2019-8688.
> 
> This release also contains many build fixes, a few media playback
> improvements, and a Web compatibility fix. For a complete list,
> the full release notes at:
> 
>   https://webkitgtk.org/2019/08/28/webkitgtk2.24.4-released.html
> 
> The detailed security advisory can be found at:
> 
>   https://webkitgtk.org/security/WSA-2019-0004.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/webkitgtk.hash | 8 ++++----
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> [...]

It would be good to consider merging this to the LTS branch as well,
which is shipping WebKitGTK 2.24.x at the moment.

Thanks in advance,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190830/c5ad4bc6/attachment.asc>
