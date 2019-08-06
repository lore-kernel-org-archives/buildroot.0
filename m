From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 06 Aug 2019 23:28:48 +0530
Subject: [Buildroot] [PATCH 1/2] utils/genrandconfig: instantiate
 SystemInfo() earlier
In-Reply-To: <20190804091319.32679-1-thomas.petazzoni@bootlin.com>
References: <20190804091319.32679-1-thomas.petazzoni@bootlin.com>
Message-ID: <1832745.hGDCQaAWZH@msi-manjaro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday, August 4, 2019 2:43:18 PM IST Thomas Petazzoni wrote:
> In a future patch, we are going to need a SystemInfo() instance in
> gen_config(), so create the SystemInfo() instance there, and pass it
> to fixup_config(), where we currently use it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested on my machine. Properly outputs a randomly generated config.

Tested-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Atharva Lele <itsatharva@gmail.com>

Regards,
Atharva Lele
