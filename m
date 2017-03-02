From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 23:24:23 +0100
Subject: [Buildroot] [PATCH 17/25] lua-bit32: remove custom extract
 commands
In-Reply-To: <20170223170047.24417-18-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-18-arnout@mind.be>
Message-ID: <20170302232423.66b3f64a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:39 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> With the reworked luarocks extraction, they are no longer needed.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/lua-bit32/lua-bit32.mk | 6 ------
>  1 file changed, 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
