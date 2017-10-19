From: Christian Stewart <christian@paral.in>
Date: Thu, 19 Oct 2017 13:20:14 -0400
Subject: [Buildroot] [RFC, v2,
	1/4] package/go: fixing crosscompilation settings
Message-ID: <CA+h8R2osm25=0sGt9hjV1wKoY6WuKbnVRm8FLiMfCaeC6kouFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, 16 Oct 2017 19:08:45 +0200, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> This patch fixes a bug with the BR2_TOOLCHAIN_HAS_THREADS variable
> handling which causes CGO_ENABLED to be always 0.
>
> Furthermore, it fixes the cross compilation options for the go compiler:
> setting CGO_ENABLED should be done only for the target compiler not the
> host one.

Tested, works fine. Signing off on the first commit in the series only.

Signed-off-by: Christian Stewart <christian@paral.in>

Best,
Christian Stewart
