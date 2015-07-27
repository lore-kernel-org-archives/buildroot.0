From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:45:00 +0200
Subject: [Buildroot] Autobuilder update: ARC toolchain updated
In-Reply-To: <9bab4b24-a7a4-46e2-a93b-06008b42ef69@email.android.com>
References: <9bab4b24-a7a4-46e2-a93b-06008b42ef69@email.android.com>
Message-ID: <20150727224500.0641e0f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Jul 2015 20:23:25 +0000, Alexey Brodkin wrote:

> Thanks for doing that.
> But I have to tell you that even with that updated toolchain .tbss issues won't go completely.
> 
> You'll see a bit of a different issue specifically linking applications with lots libstdc++.
> 
> We're aware of that new issue (.tbss fix was unfortunately incomplete) and working on proper fix.

Ok, good.

> BTW when are you going to cut rc1? I'll try to make sure our fix is ready by then.

Normally, end of July/beginning of August.

But it's not a big deal if the fix comes a bit later, we can merge it
after -rc1, and I can rebuild the toolchain once again.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
