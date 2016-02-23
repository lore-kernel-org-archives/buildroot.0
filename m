From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 10:10:20 +0100
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <56CBA547.3020200@zacarias.com.ar>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
 <20160221222816.4e53e921@free-electrons.com>
 <56CA62D8.10309@zacarias.com.ar> <56CB9DFA.506@mind.be>
 <56CBA547.3020200@zacarias.com.ar>
Message-ID: <20160223101020.0a87c0f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

On Mon, 22 Feb 2016 21:18:15 -0300, Gustavo Zacarias wrote:

> I was asked to step in and maintain webkitgtk, gtk3 & accesory packages.
> And this has been sitting in patchwork for quite some time with no 
> comments or anything and rotting down (this = the gtk3 bump and other 
> pieces that depend on it).
> It means i'll just take is as there's no interest and just leave it rot 
> completely - i didn't pick this up because it's something i use or have 
> any particular interest in.
> If you're implying i don't help in other aspects and i just care about 
> what i send i suggest you take a look at lots of autobuilder fixes for 
> packages i never use.

As Arnout said, all our patches are definitely appreciated, and most of
them are applied really quickly. Some of them indeed take more time,
but there's nothing personal against you: we have ~300 other patches
sitting in patchwork.

However, you are almost never helping us by reviewing/testing patches
from others. Due to this, instead of applying your patches, I have to
review and test patches from other contributors. Conclusion: if you
want your patches to be applied faster, the best way is to help the
community by reviewing and testing patches. Your review and test effort
would be really valuable: you are a long-time Buildroot developer, so
you know all the best practices, usual pitfalls and all, which means
that we trust your review.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
