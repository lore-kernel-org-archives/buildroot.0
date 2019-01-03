From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Jan 2019 22:52:14 +0100
Subject: [Buildroot] [PATCH] package/terminology: bump to version 1.3.2
In-Reply-To: <20190102231026.8189-2-romain.naour@gmail.com>
References: <20190102231026.8189-1-romain.naour@gmail.com>
 <20190102231026.8189-2-romain.naour@gmail.com>
Message-ID: <CACXmViZ1d0A9viQ8Lcs=wn8feKXNE=kG_-oQ97DD7BkwW=oz_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 3, 2019 at 12:10 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> See:
> https://sourceforge.net/p/enlightenment/mailman/message/36497308/
>
> This version contain a fix [1] for newer meson (0.49.0) [2]:
>
> [1] https://git.enlightenment.org/apps/terminology.git/commit/?id=80e36857a28bb2a0b0fdd58b0cd86b110a180efc
> [2] https://github.com/mesonbuild/meson/issues/3600
>
> This affect terminology build system since data/themes/meson.build
> use "in" which is now a reserved keyword.
>
> Fixes:
> http://autobuild.buildroot.net/results/6e4/6e445e8f0c973fad58937824452aac9b593b3e8d/build-end.log
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Commited, thanks.

-- 
Bye, Peter Korsgaard
