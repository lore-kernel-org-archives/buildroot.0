From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 19:24:44 +0200
Subject: [Buildroot] [PATCH v2 3/4] gdb: enable simulator support for
 host build
In-Reply-To: <20160528164032.GL22609@waldemar-brodkorb.de>
References: <20160513121651.GA30939@waldemar-brodkorb.de>
 <20160528154933.575c86c3@free-electrons.com>
 <20160528154811.GJ22609@waldemar-brodkorb.de>
 <20160528183514.4fe9597d@free-electrons.com>
 <20160528164032.GL22609@waldemar-brodkorb.de>
Message-ID: <20160528192444.76189c23@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 18:40:33 +0200, Waldemar Brodkorb wrote:

> 7.11 is affected.
> How do you understand his workaround? 

Apparently, Mike said that removing one file was enough. Maybe we could
try this?

> I think there are a lot of developers out there would saying
> out-of-tree builds are good and in-tree might fail and we don't
> care. (.. OpenBSD'ler.. )

out-of-tree builds are good, but it's not a reason to use them as a
workaround for a bug causing in-tree builds to fail.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
