From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 23:34:41 +0100
Subject: [Buildroot] [PATCH 1/2] mkpimage: bump to latest barebox version
In-Reply-To: <20170130103326.14427-1-lionel@svkt.org>
References: <20170128112720.umcchfeyyc7i6rdo@localhost.localdomain>
 <20170130103326.14427-1-lionel@svkt.org>
Message-ID: <20170209233441.3a3949e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Jan 2017 11:33:25 +0100, Lionel Flandrin wrote:
> Adds support for header v1 (used on Arria 10 SoCs)
> 
> Signed-off-by: Lionel Flandrin <lionel@svkt.org>
> ---
>  package/mkpimage/mkpimage.c  | 149 ++++++++++++++++++++++++++++++++++---------
>  package/mkpimage/mkpimage.mk |   6 +-
>  2 files changed, 122 insertions(+), 33 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
