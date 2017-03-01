From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:16:45 +0100
Subject: [Buildroot] [PATCH next] memtool: new package
In-Reply-To: <20170226204427.31044-1-peter@korsgaard.com>
References: <20170226204427.31044-1-peter@korsgaard.com>
Message-ID: <20170301221645.6e1120af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Feb 2017 21:44:27 +0100, Peter Korsgaard wrote:
> memtool allows one to read and write memory mapped registers via /dev/mem.
> The commands are inspired by the respective commands of the barebox
> bootloader.  This is handy during driver development to inspect and modify
> register settings.  It can also be used to modify regular files and
> character devices (e.g. to paint to /dev/fb0).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in            |  1 +
>  package/memtool/Config.in    | 13 +++++++++++++
>  package/memtool/memtool.hash |  2 ++
>  package/memtool/memtool.mk   | 13 +++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/memtool/Config.in
>  create mode 100644 package/memtool/memtool.hash
>  create mode 100644 package/memtool/memtool.mk

Applied to master with an entry added to the DEVELOPERS file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
