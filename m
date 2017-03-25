From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:57:21 +0100
Subject: [Buildroot] [PATCH] openvpn: Add explicit support for external
 lz4
In-Reply-To: <20170324071203.32449-1-jer@airfi.aero>
References: <20170324071203.32449-1-jer@airfi.aero>
Message-ID: <20170325145721.059a7941@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Mar 2017 08:12:03 +0100, Jeroen Roovers wrote:
> 2.4.0 added lz4 support. Make that choice explicit or the bundled compat-lz4
> "stub" will be used.
> 
> Signed-off-by: Jeroen Roovers <jer@airfi.aero>
> ---
>  package/openvpn/Config.in  | 7 +++++++
>  package/openvpn/openvpn.mk | 6 ++++++
>  2 files changed, 13 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
