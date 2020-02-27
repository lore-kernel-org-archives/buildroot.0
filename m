From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 17:54:43 +0100
Subject: [Buildroot] Untractably slow CVE checks in
 support/scripts/pkg-stat
In-Reply-To: <ac23d55f-c8a5-587d-2c98-5967f3abfa14@railnova.eu>
References: <ac23d55f-c8a5-587d-2c98-5967f3abfa14@railnova.eu>
Message-ID: <20200227175443.71a6461f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Titouan,

On Thu, 27 Feb 2020 16:05:41 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> 1. Uninstall the version distributed by apt:
>     `apt remove python-ijson`
> 2. Install the latest version with pip:
>     `pip install [--user] ijson`
> 3. Start the pkg-stat script, it should complete in less than 5 minutes.

Thanks a lot for the investigation and research!

I tested with ijson 2.6 installed from pip, and things are indeed a lot
better. It's not 5 minutes though:

real	19m55.557s
user	18m7.632s
sys	1m53.140s

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
