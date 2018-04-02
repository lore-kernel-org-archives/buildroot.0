From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 15:24:00 +0200
Subject: [Buildroot] [PATCH 3/3] linux: bump default to version 4.16
In-Reply-To: <qem9pexjon.ln2@ID-313208.user.individual.net>
References: <20180402130028.4518-1-bernd.kuhls@t-online.de>
 <20180402130028.4518-3-bernd.kuhls@t-online.de>
 <qem9pexjon.ln2@ID-313208.user.individual.net>
Message-ID: <20180402152400.4099fa3a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 02 Apr 2018 15:06:02 +0200, Bernd Kuhls wrote:

> I forgot to add "v2" to the subject of this patch...

Do you manually adds those vX prefixes in the patches ?

Just in case you didn't know:

 - git format-patch -v42

 - git format-patch --subject-prefix="PATCH v42"

will automatically generate patches with titles starting with:

  [PATCH v42 X/Y]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
