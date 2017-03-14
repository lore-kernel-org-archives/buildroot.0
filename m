From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:20:57 +0100
Subject: [Buildroot] [PATCH] package/libscrypt: Allow the package
 makefile to add -fPIC to CFLAGS
In-Reply-To: <20170314083608.25519-1-stefan.sorensen@spectralink.com>
References: <20170314083608.25519-1-stefan.sorensen@spectralink.com>
Message-ID: <20170314232057.40fcd87a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 09:36:08 +0100, Stefan S?rensen wrote:
> Fixes
> http://autobuild.buildroot.net/results/b25/b256d003d841e492da073788198203e7cbc834cf/
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  ...g-options-to-CFLAGS-and-LDFLAGS-variables.patch | 31 ++++++++++++++++++++++
>  package/libscrypt/libscrypt.mk                     |  7 -----
>  2 files changed, 31 insertions(+), 7 deletions(-)
>  create mode 100644 package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch

I've extended the commit log and the patch description, and applied to
master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
