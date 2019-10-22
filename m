From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 22:20:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-pymodbus: depends on
 python-pyserial
In-Reply-To: <20191022184116.5981-2-fontaine.fabrice@gmail.com>
References: <20191022184116.5981-1-fontaine.fabrice@gmail.com>
 <20191022184116.5981-2-fontaine.fabrice@gmail.com>
Message-ID: <20191022222011.62658ace@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Oct 2019 20:41:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python-pymodbus depends on python-pyserial, not python-serial
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

There is no package named python-pyserial in Buildroot, it's named
python-serial. So I'm not sure what you're doing in this patch :-/

Could you clarify ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
