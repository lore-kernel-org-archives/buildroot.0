From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 May 2019 11:15:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnfc: support pcsc-lite
In-Reply-To: <CABWPoFHO0c4GoBmS0qBFhS=XGEz4qhUMF6+REWwkrngv0ZCbVg@mail.gmail.com>
References: <CABWPoFHO0c4GoBmS0qBFhS=XGEz4qhUMF6+REWwkrngv0ZCbVg@mail.gmail.com>
Message-ID: <20190527111550.4bbf2dcc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 May 2019 10:27:03 +0200
Raul Hidalgo Caballero <deinok@deinok.com> wrote:

> 

Here as well: please send with git send-email so that we can do a
proper review.

A few comments though:

 - We need you to use your real name as the patch author and for the
   Signed-off-by line

 - Why are you making pcsc-lite a mandatory dependency of libnfc ?
   Since libnfc builds fine today with pcsc-lite, it means it should be
   an optional dependency. Either add a sub-option to enable the
   different libnfc drivers, or automatically add pcsc-lite to the
   dependencies if BR2_PACKAGE_PCSC_LITE=y.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
