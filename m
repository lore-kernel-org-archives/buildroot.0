From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 21:38:28 +0200
Subject: [Buildroot] [PATCH v2 3/4] libsoup: add libsoup-gnome support
In-Reply-To: <1405697979-23957-4-git-send-email-hadrien.boutteville@gmail.com>
References: <1405697979-23957-1-git-send-email-hadrien.boutteville@gmail.com>
 <1405697979-23957-4-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140718213828.05e42401@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hadrien Boutteville,

On Fri, 18 Jul 2014 17:39:38 +0200, Hadrien Boutteville wrote:
> libsoup can build a libsoup-gnome library. Add support for
> libsoup-gnome as it is a dependency of Midori.
> 
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/libsoup/Config.in  | 5 +++++
>  package/libsoup/libsoup.mk | 8 +++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
