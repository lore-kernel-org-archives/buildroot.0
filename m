From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 23:23:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/augeas: drop AUTORECONF
In-Reply-To: <20190907200913.26642-1-fontaine.fabrice@gmail.com>
References: <20190907200913.26642-1-fontaine.fabrice@gmail.com>
Message-ID: <20190907232333.30cff6d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Sep 2019 22:09:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> autoreconf is not needed since bump to version 1.10.1 in
> commit 3cd6faa04cef1b1ebf5c5d47eeaf7e812ed02cb7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/augeas/augeas.mk | 3 ---
>  1 file changed, 3 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
