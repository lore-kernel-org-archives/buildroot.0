From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 May 2019 11:14:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender: bump version to 2.0.0
In-Reply-To: <CABWPoFEDQS+9+NscGhw-qWs_PQNaiQvMyHwYb=UrXU1n_SUqxg@mail.gmail.com>
References: <CABWPoFEDQS+9+NscGhw-qWs_PQNaiQvMyHwYb=UrXU1n_SUqxg@mail.gmail.com>
Message-ID: <20190527111402.5380b2e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Raul,

On Mon, 27 May 2019 10:00:25 +0200
Raul Hidalgo Caballero <deinok@deinok.com> wrote:

> 

Here as well, please send with git send-email. But in addition, I'd
like to mention we already had a patch bumping mender to 2.0.0 from
Adam Duskett, but it had some minor issues. I'm sure Adam will send a
new iteration of it soon.

Your patch is probably incorrect, because you bump to 2.0.0 without
updating the hash of the license files, while they apparently changed
between 1.7.0 and 2.0.0, so your patch most likely breaks "make
legal-info".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
