From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Thu, 30 Apr 2020 15:28:33 +0200
Subject: [Buildroot] [PATCH] package/python-xmodem: new package
In-Reply-To: <20200430132020.2476465-1-m.niestroj@grinn-global.com>
References: <20200430132020.2476465-1-m.niestroj@grinn-global.com>
Message-ID: <87d07p85mm.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All!

The problem with this package is that there is no license file when we
download from pypi. But there is one on github. Question is: what should
we do about it?

Marcin Niestroj <m.niestroj@grinn-global.com> writes:

> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-xmodem/Config.in          |  6 ++++++
>  package/python-xmodem/python-xmodem.hash |  3 +++
>  package/python-xmodem/python-xmodem.mk   | 13 +++++++++++++
>  5 files changed, 24 insertions(+)
>  create mode 100644 package/python-xmodem/Config.in
>  create mode 100644 package/python-xmodem/python-xmodem.hash
>  create mode 100644 package/python-xmodem/python-xmodem.mk
>
> [snip]

-- 
Marcin Niestr?j
