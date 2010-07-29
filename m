From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 13:38:37 +0200
Subject: [Buildroot] [PATCH 1/2] gcc: remove option on SJLJ exceptions
In-Reply-To: <201007290538.09064.minimod@morethan.org>
References: <cover.1280385006.git.thomas.petazzoni@free-electrons.com>
	<6d4a992e2b817cc14276c68e0321edaf66450cf3.1280385006.git.thomas.petazzoni@free-electrons.com>
	<201007290538.09064.minimod@morethan.org>
Message-ID: <20100729133837.5680e0c2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Jul 2010 05:38:06 -0500
"Michael S. Zick" <minimod@morethan.org> wrote:

> And of course you confirmed that the Lua package's
> error handling still works properly, complete with
> same backtrace that is produced when SJLJ exceptions are enabled.

No, I did not.

> You did make that test didn't you?

Why do you need to be so aggressive ? It is possible that removing this
option was a mistake, but there's *really* no need to be so
aggressive. It only reduces the motivation to look at the problem...

So, trying to be constructive, how can I test that Lua still produces
correct backtraces ? (I'm not a Lua programmer at all).

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
