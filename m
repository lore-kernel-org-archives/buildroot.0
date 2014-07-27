From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 22:37:47 +0200
Subject: [Buildroot] [PATCH 1/1] system: move tz setup outside of
 default skeleton clause
In-Reply-To: <1406481852-15592-1-git-send-email-danomimanchego123@gmail.com>
References: <1406481852-15592-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140727223747.189a2e58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sun, 27 Jul 2014 13:24:11 -0400, Danomi Manchego wrote:
> Allow time zone setup and installation for configurations
> using custom skeletons as well as default skeletons.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  system/Config.in |   26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
