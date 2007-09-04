From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 4 Sep 2007 23:07:09 +0200
Subject: [Buildroot] buggy Initramfs in linux
In-Reply-To: <1188927764.11158.5.camel@aeglos.sweden.atmel.com>
References: <1188927764.11158.5.camel@aeglos.sweden.atmel.com>
Message-ID: <20070904210709.GW11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 04, 2007 at 07:42:44PM +0200, Ulf Samuelsson wrote:
>If the initramfs support is not selected in the config system,
>and the .config file copied into the linux directory
>contains the initramfs info then the target/linux/Makefile.in
>will not remove it, causing a failed build

Should be fixed in r19784. Thanks for the notice.
