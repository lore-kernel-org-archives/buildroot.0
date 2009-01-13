From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 14 Jan 2009 10:11:30 +1100
Subject: [Buildroot] external toolchain --sysroot
In-Reply-To: <eaeb93bb0901122052o16f639f8nbc8c25d989fdb876@mail.gmail.com>
References: <20090113043014.GA5238@cloud.net.au>
	<eaeb93bb0901122045p6e653f67of6172a11f28010d8@mail.gmail.com>
	<eaeb93bb0901122046g2ed61992n672221d163c74971@mail.gmail.com>
	<eaeb93bb0901122052o16f639f8nbc8c25d989fdb876@mail.gmail.com>
Message-ID: <20090113231130.GA24352@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 12, 2009 at 10:52:49PM -0600, Eric wrote:
> Also I did build my tool chain with sysroot support ... so you would have to
> do the same to get that to work.

Right. I notice that --sysroot is being used even if gcc is compiled
without it. And it appears that sysroot is buggy in gcc 4.1.2, which is
what I'm using currently.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
