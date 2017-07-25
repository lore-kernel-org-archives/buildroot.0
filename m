From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:10:46 +0200
Subject: [Buildroot] [PATCH v4] zstd: add new package
In-Reply-To: <20170725165603.27626-1-andrew.smirnov@gmail.com>
References: <20170725165603.27626-1-andrew.smirnov@gmail.com>
Message-ID: <20170725221046.2dab7ae1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Jul 2017 09:56:03 -0700, Andrey Smirnov wrote:
> Add package to provide Zstandard compression tools
> (see https://facebook.github.io/zstd)
> 
> Minimal config snippet for utils/test-pkg is as follows:
> 
> BR2_PACKAGE_ZSTD=y
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

Applied with the following changes:

    [Thomas:
     - use "config" instead of "menuconfig" in Config.in
     - add missing final newline in Config.in
     - pass DESTDIR=$(TARGET_DIR) only at install time
     - wrap too long lines in the .mk file
     - remove useless empty newline at end of .hash file.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
