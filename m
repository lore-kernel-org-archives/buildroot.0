From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jul 2019 23:11:50 +0200
Subject: [Buildroot] [PATCH v4 09/15] arch/arm: move dependency on
 64-bit down to individual cores
In-Reply-To: <20190620100725.105587-10-giulio.benetti@micronovasrl.com>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-10-giulio.benetti@micronovasrl.com>
Message-ID: <3060783d-2e26-781c-6717-a30c17e846ce@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/06/2019 12:07, Giulio Benetti wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> It will make it easier to introduce new variants anywhere in the
> list, when those variants have different bitness requirements.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

 I've applied this and the rest of the series to master, thanks. With some small
modifications, noted in each individual patch.

 Regards,
 Arnout
