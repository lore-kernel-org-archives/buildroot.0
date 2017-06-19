From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon, 19 Jun 2017 22:47:11 +0530
Subject: [Buildroot] [PATCH 0/3] core: check hashes of license files
In-Reply-To: <cover.1497772831.git.yann.morin.1998@free.fr>
References: <cover.1497772831.git.yann.morin.1998@free.fr>
Message-ID: <CA+NV+Vmd+uwWztf4Po71Kh3WHPVzPR++HSUdmBoF1oddsS14ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun, Jun 18, 2017 at 1:31 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Hello All!
>
> This small series is a proposal to check the hashes of the license files
> during legal-info, to catch the packages whose license changes but where
> the text of the new license is in the same file.

Thanks for this series. Checking hashes of the license files during
legal-info stage looks logical but we discussed about doing that after
downloading sources so that change in license file is noticed early
(as a part of build test after version bump).

Regards,
Rahul

>
> This was suggested by Rahul recently:
>     http://lists.busybox.net/pipermail/buildroot/2017-June/194425.html
>
>
> Regards,
> Yann E. MORIN.
>
>
> The following changes since commit 859764ac39c18c6aaabbb6a1a47f2fa2e5793044
>
>   linux-headers: bump 4.{1, 4, 9, 11}.x series (2017-06-17 16:17:04 +0200)
>
>
> are available in the git repository at:
>
>   git://git.buildroot.org/~ymorin/git/buildroot.git
>
> for you to fetch changes up to 41013c99543173da1ec547219c7f67e52d323a40
>
>   docs/manual: document hashes for license files (2017-06-18 09:59:06 +0200)
>
>
> ----------------------------------------------------------------
> Yann E. MORIN (3):
>       core/pkg-util: pass package directory and name when saving license files
>       core/pkg-utils: check hashes of license files
>       docs/manual: document hashes for license files
>
>  Makefile                                  |  2 +-
>  docs/manual/adding-packages-directory.txt | 16 ++++++++++++++--
>  package/pkg-generic.mk                    |  2 +-
>  package/pkg-utils.mk                      | 11 ++++++++---
>  4 files changed, 24 insertions(+), 7 deletions(-)
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
