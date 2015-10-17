From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sat, 17 Oct 2015 15:52:40 +0200
Subject: [Buildroot] [PATCH 2/4] board/raspberrypi: prepare the image
 files for the target
In-Reply-To: <20151017114519.GA3717@free.fr>
References: <20150820143005.GA6441@ketchup.mtl.sfl>
 <1440273688-92868-2-git-send-email-benoit@wsystem.com>
 <20151017114519.GA3717@free.fr>
Message-ID: <CA+sos79vHmtQK6rafnfMS7q3pve85CC7jYHyhvmAAgwqRtH4gQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, Oct 17, 2015 at 1:45 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[...]
> Why not simply:
>     cp -l "${BINARIES_DIR}/"*.dtb "${RPI_FW_BIN_DIR}"
>
> I'd prefer we keep the DTB files where they were installed, so the user
> does not get confused.
[...]
> As I said above, I'd prefer the DTB files be left in their original
> location, with the ones in rpi-firmware/ being only copies of, or
> hard-links to, the originals.

OK, I'll do that.

Best regards,
Beno?t
