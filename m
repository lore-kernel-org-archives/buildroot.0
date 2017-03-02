From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:45:33 +0100
Subject: [Buildroot] [PATCH 05/25] lpty: remove LPTY_VERSION_UPSTREAM
In-Reply-To: <20170223170047.24417-6-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-6-arnout@mind.be>
Message-ID: <20170302224533.3f21eb78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:27 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> It is not used for anything.
> 
> Note that the SUBDIR is NOT the usual lpty-$(LPTY_VERSION_UPSTREAM);
> it *does* have the rockspec version in its name.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/lpty/lpty.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
