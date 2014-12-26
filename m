From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 15:14:26 +0100
Subject: [Buildroot] [PATCH] package/ntp: fix installation
In-Reply-To: <1419542692-21651-1-git-send-email-yann.morin.1998@free.fr>
References: <1419542692-21651-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141226151426.2a6cdc9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 25 Dec 2014 22:24:52 +0100, Yann E. MORIN wrote:
> Since 5d5c9a8 (ntp: security bump to version 4.2.8), scripts/ntp-wait
> and scripts/ntptrace are no longer scripts themselves, but directories
> containing those scripts.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/518/5189e84004bf28b891da3ee07fecc8717b4e8e8c/ (ntp-wait)
>     http://autobuild.buildroot.org/results/005/0056192a06d44814a0279637c4bcbf602936e7ff/ (ntptrace)
>     http://autobuild.buildroot.org/results/8f3/8f372acf73743edf8027cda6865ba1aa7b6413a3/ (both)
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
