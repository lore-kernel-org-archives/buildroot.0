From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 21:32:57 +0100
Subject: [Buildroot] [PATCH] uclibc-ng-test: pass LDFLAGS while building
In-Reply-To: <20170222182743.GA16529@waldemar-brodkorb.de>
References: <20170222182743.GA16529@waldemar-brodkorb.de>
Message-ID: <20170222213257.5ea4b813@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 19:27:43 +0100, Waldemar Brodkorb wrote:
> When static linking is in use we need to pass -static while
> linking.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/37ca35854a36fab1690f6ae789e338a1e55307f6
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc-ng-test/uclibc-ng-test.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
