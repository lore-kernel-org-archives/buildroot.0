From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 12:38:46 +0200
Subject: [Buildroot] [PATCH 00/30] Splitting the toolchain-external
 package
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161025123846.30632376@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Peter, Arnout, Yann and Thomas DS in Cc.

On Sun, 23 Oct 2016 22:48:01 +0200, Romain Naour wrote:

> Here is the first version of the toolchain-external package infra which
> was started by Thomas Petazzoni last year. This new infra will clearly
> separate the common external toolchain logic from the
> toolchain-specific details and generally make the external toolchain
> code hopefully easier to maintain.
> 
> The four first patches change all the functions used in
> INSTALL_STAGING_CMDS and INSTALL_TARGET_CMDS to take more arguments
> rather than using global variables.
> 
> Then all toolchain packages are introduced but are not yet used since
> the new toolchain-external infra will be added latter.
> 
> Before introduce the new toolchain-external infra, some specific
> functions and logic are moved into a separate file (toolchain utility,
> toolchain wrapper, variables definition, uClibc, musl and bfin).
> 
> The final patch introduce the new toolchain external package infra
> (see it's commit log for more information).

Unless someone disagrees with this series, my intent is to apply it in
the next few days. For having worked on this topic, I know how much of
a pain it is to keep this series rebased on top of the latest master,
so I'd like to get this merged soon.

Therefore, if you disagree, please speak up now. If your only concerns
are typos or further possible improvements, then those can be addressed
once the series is merged, in patches of much more reasonable size.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
