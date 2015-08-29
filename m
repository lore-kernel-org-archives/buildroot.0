From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 10:36:44 +0200
Subject: [Buildroot] [PATCH] docs/manual: makedevs only accepts
 numerical values
In-Reply-To: <1440800701-26153-1-git-send-email-yann.morin.1998@free.fr>
References: <1440800701-26153-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150829103644.747302a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 29 Aug 2015 00:25:01 +0200, Yann E. MORIN wrote:
> Because of a limitation in how makedevs resolves names [0], usernames
> and groupnames would be resolved with UIDs and GIDs from the host, not
> the target.
> 
> Fixing makedevs would involve us rewriting a /etc/passwd and /etc/group
> parser (not too complex, still not trivial).
> 
> Document that the user and group fields should only be numbers, not
> names. Also, the manual is currently mislieading, as an example indeed

mislieading -> misleading typo fixed.

And patch applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
