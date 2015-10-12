From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 00:02:39 +0200
Subject: [Buildroot] [PATCH v2] toolchain: add mips64 for uClibc-ng
In-Reply-To: <20150811052205.GA24260@waldemar-brodkorb.de>
References: <20150811052205.GA24260@waldemar-brodkorb.de>
Message-ID: <20151013000239.561231b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 11 Aug 2015 07:22:05 +0200, Waldemar Brodkorb wrote:
> Filter out all other uClibc versions, as they containing
> serious bugs for mips64.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> Changes v1 -> v2:
>   - filter out uClibc versions as requested by Thomas Petazzoni

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
