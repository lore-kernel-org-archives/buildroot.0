From: Alexander Dahl <post@lespocky.de>
Date: Wed, 23 Jan 2019 11:28:25 +0100
Subject: [Buildroot] [PATCH] package/iperf: bump to 2.0.13
In-Reply-To: <1548182070-35867-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1548182070-35867-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20190123102825.gtswtv7v3lvtg3vh@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Tue, Jan 22, 2019 at 12:34:30PM -0600, Matt Weber wrote:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/iperf/iperf.hash | 5 +++--
>  package/iperf/iperf.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
> index 3540c6e..696085c 100644
> --- a/package/iperf/iperf.hash
> +++ b/package/iperf/iperf.hash
> @@ -1,5 +1,6 @@
>  # From https://sourceforge.net/projects/iperf2/files/
> -sha1	909b469bbbc38508cd268e334a6ec319c3116f15	iperf-2.0.12.tar.gz
> +sha1	3eb21c329af811af53a2c816e1ed26b3dd2c259f	iperf-2.0.13.tar.gz

ERROR: iperf-2.0.13.tar.gz has wrong sha1 hash:
ERROR: expected: 3eb21c329af811af53a2c816e1ed26b3dd2c259f
ERROR: got     : 0c7625c61087b9e6866421abb8bb533658b40a8d
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

The hashes shown on https://sourceforge.net/projects/iperf2/files/
are:

SHA1: 0c7625c61087b9e6866421abb8bb533658b40a8d
MD5: 31ea1c6d5cbf80b16ff3abe4288dad5e

The patch was already committed to master. :-/

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190123/b4d71895/attachment.asc>
