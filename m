From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 06:59:16 +0200
Subject: [Buildroot] [PATCH] generatelocales: fix 'cut' invocation
In-Reply-To: <1377150238-3467-1-git-send-email-arnout@mind.be>
References: <20130822022639.GA6009@zuhnb712.ap.bm.net>
 <1377150238-3467-1-git-send-email-arnout@mind.be>
Message-ID: <20130823065916.5f58d365@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Thu, 22 Aug 2013 07:43:58 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> 'cut' needs to be invoked with the -s option to make sure it doesn't
> print anything when the delimiter isn't found. This is particularly
> important for the charmap detection, because UTF-8 is appended if
> the charmap is empty. But without -s, it will never be empty.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
