From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 22:10:36 +0100
Subject: [Buildroot] [PATCH v2] elfutils: fix sparc64 build,
 -fPIC required
In-Reply-To: <20151103210438.GA13049@waldemar-brodkorb.de>
References: <20151103210438.GA13049@waldemar-brodkorb.de>
Message-ID: <20151103221036.45c112b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 3 Nov 2015 22:04:38 +0100, Waldemar Brodkorb wrote:
> Fixes following autobuild errors:
> http://autobuild.buildroot.net/results/82cc7766d2c805146e94baf82a24d1002f56593d/
> http://autobuild.buildroot.net/results/ca4ca362581ee0111cba389d1afbff287692c21b/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - use ELFUTILS_CFLAGS and remove duplication of filter-out
>     suggested by Thomas Petazzoni

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
