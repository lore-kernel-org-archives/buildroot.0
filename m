From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:48:28 +0100
Subject: [Buildroot] [PATCH 08/25] ljlinenoise: remove default
 definition of PKG_SUBDIR
In-Reply-To: <20170223170047.24417-9-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-9-arnout@mind.be>
Message-ID: <20170302224828.5c520b5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:30 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The luarocks infra already provides the correct default value for
> PKG_SUBDIR, so it doesn't have to be defined in the .mk file.
> 
> Therefore, _VERSION_UPSTREAM doesn't need to be defined either.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/ljlinenoise/ljlinenoise.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Patches 08/25 to 12/25 included applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
