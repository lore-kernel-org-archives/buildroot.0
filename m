From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jul 2014 00:01:14 +0200
Subject: [Buildroot] [PATCH v3] use default binutils for sh architecture
In-Reply-To: <20140702153153.GA29927@waldemar-brodkorb.de>
References: <20140702153153.GA29927@waldemar-brodkorb.de>
Message-ID: <20140703000114.011a24ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 2 Jul 2014 17:31:53 +0200, Waldemar Brodkorb wrote:
> Tested toolchain compiles with binutils 2.22 and 2.24.
> Result tested in Qemu 2.0.0. (only little endian version
> tested)
> 
> ---
>  Changes v2 -> v3:
>    - sync with upstream changes
>  Changes v1 -> v2:
>    - split binutils and kernel patch (requested via #buildroot)
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/binutils/Config.in.host |    1 -
>  1 file changed, 1 deletion(-)

Your Signed-off-by line is misplaced, it should be before the first
'---', otherwise it gets stripped by git when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
