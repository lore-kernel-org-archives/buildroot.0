From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 19:31:46 +0200
Subject: [Buildroot] [PATCH v2] package/gdb: gdb 7.9 fix uClibc build
 whitout MMU
In-Reply-To: <1428842977-9145-1-git-send-email-romain.naour@openwide.fr>
References: <1428842977-9145-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150412193146.48902279@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 12 Apr 2015 14:49:37 +0200, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> v2: patch clean up
> ---
>  .../0001-gdbserver-fix-uClibc-whithout-MMU.patch   | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
