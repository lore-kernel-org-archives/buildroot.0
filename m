From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 21:13:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpm: drop binutils optional
 dependency
In-Reply-To: <20190331144934.24152-1-fontaine.fabrice@gmail.com>
References: <20190331144934.24152-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331211348.2d8577d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 16:49:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Since bump to version 4.14.2.1, binutils is not an optional dependency
> anymore as bfd.h has been droped in 4.14.0 with
> https://github.com/rpm-software-management/rpm/commit/245b5a3b4b6d616adf47361137987e90f8dab22c
> 
> So drop it and manage optional elfutils dependency through a
> single line (and drop binutils/elfutils comment)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rpm/rpm.mk | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
