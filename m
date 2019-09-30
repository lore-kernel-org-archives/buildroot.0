From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 14:29:56 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/libsodium: add config for
 full build
In-Reply-To: <91913550-aa51-4b85-225b-e1b674e91e66@mind.be>
References: <20190923082902.28472-1-adrien@gallouet.fr>
 <20190928231934.236e5f83@windsurf>
 <CAFtSRGDT0udQCby-XzsZTe-VUTBSva7cdrh6wpZ_nMf+J8Pz2Q@mail.gmail.com>
 <20190929090408.67e6d38e@windsurf>
 <91913550-aa51-4b85-225b-e1b674e91e66@mind.be>
Message-ID: <20190930142956.7be9dcea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 12:51:35 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  I believe we have had problems in the past where there was some MINIMAL option,
> but then some other package needed something from the non-minimal set. Then it
> has to do a 'depends on' instead of a 'select'.

That makes a lot of sense indeed. So we should always have option that
"add" more stuff, and never option that "remove" stuff for that reason.

Thanks for the feedback, I hadn't thought about this.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
