From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 2 Apr 2008 11:20:05 +1100
Subject: [Buildroot] [PATCH] add romfs support
In-Reply-To: <3530b0eb0804011424t3d88f2f2sc6777f9d7a9edf57@mail.gmail.com>
References: <3530b0eb0804011424t3d88f2f2sc6777f9d7a9edf57@mail.gmail.com>
Message-ID: <20080402002005.GC4616@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 01, 2008 at 02:24:00PM -0700, digitalpeer wrote:
> The following patch adds the ability to generate a romfs image using genromfs.

Thanks, committed in rev 21618.

Two notes;

1. Your patch was word-wrapped in a few places.

2. Needed to edit target/Config.in to include target/romfs/Config.in
also. I guess you did this but forgot to send the patch.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
