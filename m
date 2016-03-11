From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Mar 2016 14:38:40 +0100
Subject: [Buildroot] Autobuilder update
In-Reply-To: <87a8m5jn94.fsf@dell.be.48ers.dk>
References: <20160310234742.3df6dff2@free-electrons.com>
 <E1aeFbm-0004jE-Q7@fli4l.lan.fli4l>
 <20160311094223.6b433df0@free-electrons.com>
 <87a8m5jn94.fsf@dell.be.48ers.dk>
Message-ID: <20160311143840.27274777@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Fri, 11 Mar 2016 11:57:11 +0100, Peter Korsgaard wrote:

> It depends on how much we're otherwise testing the internal toolchain? I
> agree that using an external toolchain is more efficient, but we should
> imho do "some" builds with the internal toolchain on various archs as
> well.

Agreed. We currently have the following internal toolchain
configurations tested:

br-arc-full-internal.config
br-arm-internal-full.config
br-microblazeel-full-internal.config
br-powerpc-internal-full.config
br-xtensa-full-internal.config

I can add some more if you have some suggestions.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
