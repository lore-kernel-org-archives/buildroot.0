From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 7 Jan 2013 21:47:35 +0100
Subject: [Buildroot] [RFC 0/2] Add support for building barebox xloader.
In-Reply-To: <1356217460-20232-1-git-send-email-marek.belisko@open-nandra.com>
References: <1356217460-20232-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <CAAfyv35ZMbYENmUjJcmZOQF5zYctM0ZqriY3y65VJC9=JiQPVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping

On Sun, Dec 23, 2012 at 12:04 AM, Marek Belisko
<marek.belisko@open-nandra.com> wrote:
> Reposting-> first time was sent to wrong mailing list.
>
> Currently Buildroot have support to build barebox only. For some board there is possibility
> to build also xloader (first stage bootloader) based on barebox. Following patches add
> support for building barebox + xloader (aka MLO) by once if user specify configuration for
> xloader.
>
> First patch move building barebox to separate directory. Second patch add support for building
> xloader. Both binaries are build in separate directories to avoid problems with not clean tree.
>
> With this patches we can build complete image for e.g. pandaboard (which is my case) without building
> anything by hand.
>
> Marek Belisko (2):
>   barebox: Build barebox in separate directory.
>   barebox: Add possibility to build also barebox xloader (MLO).
>
>  boot/barebox/Config.in  |   28 ++++++++++++++++++++++++++++
>  boot/barebox/barebox.mk |   45 ++++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 66 insertions(+), 7 deletions(-)
>
> --
> 1.7.10.4
>

Cheers,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
