From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Dec 2013 06:52:57 +0200
Subject: [Buildroot] Moschip MCS8142 SoC
In-Reply-To: <OFA1E9F549.035B351F-ON86257C36.00138A7C-86257C36.001656E7@rockwellcollins.com>
References: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
 <OFA1E9F549.035B351F-ON86257C36.00138A7C-86257C36.001656E7@rockwellcollins.com>
Message-ID: <20131203045257.GJ3720@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Mon, Dec 02, 2013 at 10:04:00PM -0600, Matthew Weber wrote:
> Has anyone happened to work with this Moschip SoC?  I found Linux BSP 
> patches for the MCS8140 (OpenWRT 3.3 Kernel plus some initial attempts at 
> mainlining around 3.7), however that MCS8140 SoC was a true ARMv5 compared 
> to the MCS8142 seems to be based on a Faraday fa526 ARMv4.  Plus I'm not 
> to sure if the bus and peripheral architecture are simliar (need to do a 
> little more research yet).
> 
> Any help is appreciated (reference docs that outline the register 
> definition, etc.) .  We're trying to get a 3.x kernel running on this 
> target to replace a older 2.6.24 blob that we can't get source for.....

You have better chances of getting useful answers at the linux-arm-kernel 
mailing list (linux-arm-kernel at lists.infradead.org).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
