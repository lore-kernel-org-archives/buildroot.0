From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 16:24:09 +0200
Subject: [Buildroot] [PATCH/next] gcc: fix gcc version dependencies for
 the PowerPC64/musl exclusion
In-Reply-To: <20160820141510.GB5784@free.fr>
References: <1471701919-30534-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160820141510.GB5784@free.fr>
Message-ID: <20160820162409.5300c606@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 16:15:10 +0200, Yann E. MORIN wrote:

> Alternatively, you could have done (which is exactly the same, if you
> use the De Morgan's law):
> 
>     depends on !BR2_powerpc64 && !BR2_powerpc64le || !BR2_TOOLCHAIN_USES_MUSL

Yes, agreed. I find my version closer to the "human" description of the
dependency: it's really a "we don't want ..." with then a big condition
in there. But I agree it's very subjective.

Thanks for your review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
