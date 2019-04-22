From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:49:42 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/suricata: new package
In-Reply-To: <20190415204410.27463-1-fontaine.fabrice@gmail.com>
References: <20190415204410.27463-1-fontaine.fabrice@gmail.com>
Message-ID: <20190422224942.34173bc2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Apr 2019 22:44:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Suricata is a free and open source, mature, fast and robust
> network threat detection engine.
> 
> The Suricata engine is capable of real time intrusion
> detection (IDS), inline intrusion prevention (IPS), network
> security monitoring (NSM) and offline pcap processing.
> 
> https://suricata-ids.org
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Update S99suricata to follow the same template than S02klogd
>  - Always disable gccprotect
>  - Enable python3
>  - Add EnvironmentFile to suricata.service

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
