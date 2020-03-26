From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 23:04:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdbusplus: needs C++17
In-Reply-To: <20200326203820.59678-1-fontaine.fabrice@gmail.com>
References: <20200326203820.59678-1-fontaine.fabrice@gmail.com>
Message-ID: <20200326230457.1d5b0110@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Mar 2020 21:38:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> sdbusplus needs C++17 since
> https://github.com/openbmc/sdbusplus/commit/ca46b9d2e958d1e4b392265f656f782899c2de1d
> 
> This is not needed for host-sdbusplus as libsdbusplus is disabled on
> host through --disable-libsdbusplus
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/65a4652e5b419f03ace109c4b3738e9b997cdabe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sdbusplus/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
