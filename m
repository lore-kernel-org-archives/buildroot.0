From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 27 Aug 2007 23:01:43 +0200
Subject: [Buildroot] [PATCH] Fix pppd make clean and small cleanup
In-Reply-To: <d6cda7730708261631y44e4c353p15a94212bee372da@mail.gmail.com>
References: <d6cda7730708261631y44e4c353p15a94212bee372da@mail.gmail.com>
Message-ID: <20070827210143.GV11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 27, 2007 at 12:31:28AM +0100, Thiago A. Corr?a wrote:
>Hi,
>
>   As subject sayd, this fixes make clean on pppd package (there is no
>rule uninstall in pppd's makefile) and does some small bits of clean
>up.

I don't remember off-hand, are the listed files all that was installed
by pppd? Please verify/double-check and let me know.

Thanks for the cleanup anyway!
