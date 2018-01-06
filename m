From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jan 2018 15:27:23 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] daq: libpcap is optional not mandatory
In-Reply-To: <20180104191739.4493-1-fontaine.fabrice@gmail.com>
References: <20180104191739.4493-1-fontaine.fabrice@gmail.com>
Message-ID: <20180106152723.2a9937c0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Jan 2018 20:17:39 +0100, Fabrice Fontaine wrote:
> daq can be compiled without libpcap thanks to --enable-pcap-module and
>  --disable-pcap-module options.
> libpcap is just a mandadory dependency of snort.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Baruch Siach):
>  - Change DAQ_CONF_ENV assignment from = to += as it is now in a ifeq
> statement to avoid issues later when someone will want to update 
> DAQ_CONF_ENV before this ifeq statement

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
