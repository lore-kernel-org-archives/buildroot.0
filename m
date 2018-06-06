From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 22:11:11 +0200
Subject: [Buildroot] [PATCH v3] libgpiod: bump version to v1.1
In-Reply-To: <20180606142824.8935-1-brgl@bgdev.pl>
References: <20180606142824.8935-1-brgl@bgdev.pl>
Message-ID: <20180606221111.610fe14d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Jun 2018 16:28:24 +0200, Bartosz Golaszewski wrote:
> This is a minor release the main feature of which are the
> object-oriented bindings for C++ and Python3. Other than that there's
> a couple bug-fixes and minor improvements all around.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> v1 -> v2:
> - install bindings conditionally based on already selected dependencies
>   rather than adding new Config options

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
