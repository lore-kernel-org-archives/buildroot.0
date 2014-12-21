From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:19:48 +0100
Subject: [Buildroot] [PATCH] package/pcre: install headers in legacy
 location
In-Reply-To: <1418490513-10957-1-git-send-email-yann.morin.1998@free.fr>
References: <1418490513-10957-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141221231948.77de4e62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 13 Dec 2014 18:08:33 +0100, Yann E. MORIN wrote:
> nmap is looking for pcre headers in pcre/pcre.h which our current
> version of pcre does not populates.
> 
> So, just create those as symlinks to the actual headers.

Do we want this, or instead do we want to fix nmap and other pcre users
to use the new location?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
