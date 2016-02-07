From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 14:15:30 +0100
Subject: [Buildroot] [PATCH v2 18/18] erlang: support choosing atomic ops
In-Reply-To: <56B73D5C.9020704@gmail.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-19-git-send-email-fhunleth@troodon-software.com>
 <56B73D5C.9020704@gmail.com>
Message-ID: <20160207141530.022f87a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Frank,

On Sun, 7 Feb 2016 13:49:32 +0100, Romain Naour wrote:

> Copy past error: BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS doesn't exist but you
> probably wanted BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS.
> 
> Maybe BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS which is defined in libatomic_ops
> package is confusing... Thomas ?

Yes, it should be renamed to BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS.
Could someone send a patch for this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
