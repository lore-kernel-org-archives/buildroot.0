From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:48:59 +0200
Subject: [Buildroot] [PATCH v2] zeromq: fix sparc32 compile
In-Reply-To: <20160604114232.GA11109@waldemar-brodkorb.de>
References: <20160604114232.GA11109@waldemar-brodkorb.de>
Message-ID: <20160607234859.40755b4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Jun 2016 13:42:33 +0200, Waldemar Brodkorb wrote:
> Code is otherwise compiled with sparcv9 optimization and
> cannot be run on sparc32 (sparcv8) machine.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> ---
> v1 -> v2:
>   - add git formatted patch requested by Thomas Petazzoni
> ---
>  .../zeromq/0003-allow-to-build-sparc-v8-leon.patch |   30 ++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/zeromq/0003-allow-to-build-sparc-v8-leon.patch

Applied to master, thanks. Please submit the patch upstream if not
already done (IIRC the zeromq developers use Github, some submitting
upstream is trivial).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
