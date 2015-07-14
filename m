From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:18:58 +0200
Subject: [Buildroot] [PATCH v2] busybox: udhcpc create leases file
In-Reply-To: <CAFt09wOaZVpkbkC+9_QVmO6gfeOzu8NiPiJ2GM3Gh6K1f_2b6w@mail.gmail.com>
References: <1432609857-26391-1-git-send-email-matt@thewebers.ws>
 <CAFt09wOaZVpkbkC+9_QVmO6gfeOzu8NiPiJ2GM3Gh6K1f_2b6w@mail.gmail.com>
Message-ID: <20150715001858.4faa192d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Sun, 12 Jul 2015 20:20:08 -0500, Matthew Weber wrote:

> Since the hook scripts where added for the udhcpc.script, is the preference
> to use a hook for something like a record of the last lease?

Yes. Your patch looks too much application-specific, so please use the
udhcpc hook mechanism to install your script through your own rootfs
overlay.

I'll mark the patch as Rejected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
