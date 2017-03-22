From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 23:11:59 +0100
Subject: [Buildroot] [PATCH 1/1] janus-gateway: bump to v0.2.2
In-Reply-To: <20170322141303.28029-1-aduskett@codeblue.com>
References: <20170322141303.28029-1-aduskett@codeblue.com>
Message-ID: <20170322231159.293a3102@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 10:13:03 -0400, Adam Duskett wrote:
> In addition, a new option sample-event-handler has been added.
> It has been disabled by default in the .mk file, as it requires
> libcurl or else it will throw a error during compilation.  If anybody
> wants the sameple-event-handler, they will need to update the Config.in
> file to check for libcurl first.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/janus-gateway/janus-gateway.hash | 2 +-
>  package/janus-gateway/janus-gateway.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied to master after tweaking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
