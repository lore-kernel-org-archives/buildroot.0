From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 23:20:16 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/lzlib: bump to version 0.4.3
In-Reply-To: <1444270374-11645-1-git-send-email-joerg.krause@embedded.rocks>
References: <1444270374-11645-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160306232016.7f4889f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu,  8 Oct 2015 04:12:54 +0200, J?rg Krause wrote:
> Switch to more recent github repository.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v1 -> v2:
>   - fix install paths for lib and lua files
> ---
>  package/lzlib/Config.in  | 2 +-
>  package/lzlib/lzlib.hash | 2 --
>  package/lzlib/lzlib.mk   | 8 +++++---
>  3 files changed, 6 insertions(+), 6 deletions(-)
>  delete mode 100644 package/lzlib/lzlib.hash

Since Fran?ois never gave any feedback, I applied your patch to master.
I've re-added a hash file since we now add hash files for
Github-sourced packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
