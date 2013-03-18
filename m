From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 16:09:58 +0100
Subject: [Buildroot] nspr and aarch64 build issue
In-Reply-To: <CABtOAfy2TVZ5JcsQ3ueFhfaRC4Qs93Uu=5sJ7rks_J8zY3GMUw@mail.gmail.com>
References: <CABtOAfxeHbNeKc8eWfxaTLPgOeh10HmF2psbXnvZh9mLF0hKTg@mail.gmail.com>
 <CABtOAfy2TVZ5JcsQ3ueFhfaRC4Qs93Uu=5sJ7rks_J8zY3GMUw@mail.gmail.com>
Message-ID: <20130318160958.1fd9ba0d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Khryukin,

On Mon, 18 Mar 2013 14:40:12 +0400, Alexander Khryukin wrote:

> Well i fixed it when do
> 
> export USE_64=1
> and run make again

Aaah, yes, found the bug. I'll send a patch soon after testing the fix.
I'll add you in Cc.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
