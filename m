From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Sep 2015 15:54:26 +0200
Subject: [Buildroot] [PATCH 2/3] uclibc: fix coreutils cut bug,
 enable needed config symbols
In-Reply-To: <20150906132929.GK8475@waldemar-brodkorb.de>
References: <20150905152423.GA23237@waldemar-brodkorb.de>
 <878u8jlwlg.fsf@dell.be.48ers.dk>
 <20150906152647.3094d7f3@free-electrons.com>
 <20150906132929.GK8475@waldemar-brodkorb.de>
Message-ID: <20150906155426.770b7aef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Sun, 6 Sep 2015 15:29:29 +0200, Waldemar Brodkorb wrote:

> Yes, would be required.
> What about your idea to deprecate uClibc-0.9.33 and snapshot?

It's an unrelated decision. For now, they are still supported, so the
fix should also be made for them.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
