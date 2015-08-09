From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:40:50 +0200
Subject: [Buildroot] [PATCH v2] haveged: for sparc we need generic
 clockgettime
In-Reply-To: <20150809092526.GA16401@waldemar-brodkorb.de>
References: <20150809092526.GA16401@waldemar-brodkorb.de>
Message-ID: <20150809114050.09506b63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 9 Aug 2015 11:25:26 +0200, Waldemar Brodkorb wrote:
> This fixes autobuilder error:
> http://autobuild.buildroot.net/results/5b8bbc30f347140309ab2f81e1fe50f517356a3e/
> 
> As sparcv9 assembly is used, we need to enable generic clock_gettime
> for sparcv8 systems.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> Changes v1 -> v2:
>   - be more specific about the subarchitecture, suggested by Thomas Petazzoni

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
