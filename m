From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Oct 2017 09:56:21 +0200
Subject: [Buildroot] [PATCH 1/1] python-msgpack: bump to version 0.4.8
In-Reply-To: <20170918161834.26882-1-bradford@density.io>
References: <20170918161834.26882-1-bradford@density.io>
Message-ID: <20171009095621.1740b041@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Sep 2017 12:18:34 -0400, Bradford Barr wrote:
> From: bradford barr <bradford@density.io>
> 
> This package doesn't actually rely on the msgpack runtime libraries, it's a
> pure python implementation. I've updated the package accordingly.
> 
> Signed-off-by: bradford barr <bradford@density.io>
> ---
>  package/python-msgpack/Config.in           | 11 ++---------
>  package/python-msgpack/python-msgpack.hash |  6 +++---
>  package/python-msgpack/python-msgpack.mk   |  5 ++---
>  3 files changed, 7 insertions(+), 15 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
