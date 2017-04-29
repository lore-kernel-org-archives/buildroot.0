From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:44:29 +0200
Subject: [Buildroot] [PATCH v7 30/31] package/libsquish: bump version to
 1.15
In-Reply-To: <20170429083751.19625-31-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <20170429083751.19625-31-bernd.kuhls@t-online.de>
Message-ID: <20170429154429.4404aa33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 10:37:50 +0200, Bernd Kuhls wrote:
> Added md5 hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libsquish/libsquish.hash | 3 ++-
>  package/libsquish/libsquish.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

This patch causes a build failure:
http://autobuild.buildroot.net/results/04c/04c30f9a425d10111974a315a6d7474e243cbbd3/build-end.log.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
