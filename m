From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:27:01 +0100
Subject: [Buildroot] [PATCH v4] package/mono: Fixing wrong
 MonoPosixHelper location
In-Reply-To: <1456434205-26293-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1456434205-26293-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160225222701.56889b0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 25 Feb 2016 22:03:25 +0100, Angelo Compagnucci wrote:
> This patch solves an host path leaking in /etc/mono/config
> that leads to searching libmonoposixhelper into the wrong path.
> This bug is fixed upstream, but not included in the current stable
> release.
> 
> Fixes bug #8651.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes
> v3 -> v4:
> * Rewording commit message
> * Retaining the previous acked-by from Arnout Vandecappelle

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
