From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 14:19:54 +0200
Subject: [Buildroot] [RFC 1/1] add musl-cross 1.1.6 external toolchain
In-Reply-To: <1429789989-14539-1-git-send-email-will_wagner@carallon.com>
References: <1429789989-14539-1-git-send-email-will_wagner@carallon.com>
Message-ID: <20150423141954.30b06ac4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear will_wagner at carallon.com,

On Thu, 23 Apr 2015 12:53:09 +0100, will_wagner at carallon.com wrote:
> From: Will Wagner <will_wagner@carallon.com>
> 
> The 1.1.6 version of musl-cross fixes the two issues preventing recent
> toolchains being used by buildroot, namely:
> - sysroot is enabled again
> - kernel headers are included again
> 
> I have added it in addition to the 1.1.1 version, as I believe we
> normally deprecate old version before removal. Also was not sure how to add
> the second version. I could have renamed the existing
> BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS to BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_1
> which would have been more consistent with other toolchains where multiple
> versions are supported, however to avoid any legacy issues I did not.

Thanks. I think we don't want to support two different versions, so if
you could just update the existing BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
option to use 1.1.6, it would be better.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
