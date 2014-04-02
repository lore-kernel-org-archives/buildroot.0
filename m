From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 02 Apr 2014 17:43:08 -0300
Subject: [Buildroot] [PATCH v2 06/41] flac: version bump 1.3.0,
 add sse support
In-Reply-To: <1396468015-1724-7-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
 <1396468015-1724-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <533C765C.7080000@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/2014 04:46 PM, Bernd Kuhls wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/flac/flac-no-altivec.patch |   28 ----------------------------
>  package/flac/flac.mk               |   16 +++++++++++++---
>  2 files changed, 13 insertions(+), 31 deletions(-)
>  delete mode 100644 package/flac/flac-no-altivec.patch

NACK without the altivec patch i sent upstream that i've previously
discussed with Sven Neumann, otherwise it breaks powerpc horribly.
It also seems to be hit & miss on mips with qemu (whereas 1.2.1 worked).
Regards.
