From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:18:23 +0200
Subject: [Buildroot] [PATCHv4] qemu/sh4-r2d: update default
 configuration to Linux 3.15.x
In-Reply-To: <20140711074020.GA18097@waldemar-brodkorb.de>
References: <20140711074020.GA18097@waldemar-brodkorb.de>
Message-ID: <20140715231823.6d02c2ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Fri, 11 Jul 2014 09:40:21 +0200, Waldemar Brodkorb wrote:
> Result tested with Qemu 2.0.0 without issues.
> Old SCI problems are fixed in Qemu.
> 
> ---
> Changes v3 -> v4:
>   - add context to subject (suggested by Baruch S.)
> Changes v2 -> v3:
>   - fix headers to 3.15 (suggested by Thomas P.)
> Changes v1 -> v2:
>   - split from binutils patch (suggested via #buildroot)
>   - comment about SCI issues in older Qemu (suggested via #buildroot)
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Next time, please put your SoB line before the first "---", or it gets
stripped when applying your patches. I once again forgot to fixup your
commit, and therefore your SoB line is missing in the Git history.

Other than that, applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
