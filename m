From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Jul 2020 21:06:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.8.4
References: <20200720171241.882043-1-aduskett@gmail.com>
Message-ID: <XnsAC00D6B63C92DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aduskett at gmail.com wrote in 
news:20200720171241.882043-1-aduskett at gmail.com:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett-
Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  package/python3/python3.hash | 6 +++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Hi Adam

python 3.8.4 fixes CVE-2020-15523:
https://docs.python.org/release/3.8.4/whatsnew/changelog.html#python-3-8-4-
final

And 3.8.5 was released today ;)
https://docs.python.org/release/3.8.5/whatsnew/changelog.html#changelog

which fixes CVE-2020-15801 & CVE-2019-20907.

Regards, Bernd
