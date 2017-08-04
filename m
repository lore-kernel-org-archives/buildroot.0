From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Aug 2017 17:40:58 +0200
Subject: [Buildroot] [PATCH] gdb: drop support for Microblaze
In-Reply-To: <bc187437-bbb7-ae6b-dce7-5ffa3e19a75d@mind.be>
References: <20170803215812.28951-1-thomas.petazzoni@free-electrons.com>
 <bc187437-bbb7-ae6b-dce7-5ffa3e19a75d@mind.be>
Message-ID: <20170804174058.1337e219@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Aug 2017 17:13:14 +0200, Arnout Vandecappelle wrote:

> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Since ARC is now the only "special" case remaining, the gdb.mk file could be
> simplified a little. But perhaps ARC is on its way upstream and we can
> completely remove the special case soonish? Anyway, that's for a separate patch.
> 
>  I'm not sure if this is for next or for master (it "fixes" build failures), so
> I didn't apply directly.

I'd be happy if we took it in master :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
