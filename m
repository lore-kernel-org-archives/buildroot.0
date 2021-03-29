From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Mar 2021 15:28:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-03-21
In-Reply-To: <20210329132357.zxqt5szg72dchddu@falbala.internal.home.lespocky.de>
References: <20210322114835.6hmpplzygzejxiab@falbala.internal.home.lespocky.de>
 <20210329132357.zxqt5szg72dchddu@falbala.internal.home.lespocky.de>
Message-ID: <20210329152803.594a910f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Mar 2021 15:23:57 +0200
Alexander Dahl <post@lespocky.de> wrote:

> On Mon, Mar 22, 2021 at 12:48:36PM +0100, Alexander Dahl wrote:
> > I'm a little unhappy to annoy anyone with this request, however
> > reports like the one below pop up over and over again in my INBOX like
> > round about once a week.    
> 
> Meanwhile I had a look at my mail archive and it's exactly once a
> week, every Monday morning since November 2020. The mail headers
> contain this:
> 
> Received: from ks383786.kimsufi.com (ks383786.kimsufi.com [94.23.254.152])
>         (Authenticated sender: bot at bootlin.com)
>         by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6A91C60017
>         for <post@lespocky.de>; Mon, 29 Mar 2021 09:29:51 +0000 (UTC)
> 
> Maybe that helps identifying the bot which sends those mails on behalf
> of Thomas?

Well, there is no surprise, the bot is me :-)

> btw: the mails don't go to the list, but to me personally only. I just
> forwarded it to the list in hope someone else than Thomas might also
> have an idea what's going on.

No, this is not exactly what happens. Developers listed in the
DEVELOPERS file receive individual e-mails just for their
packages/defconfigs, if there is any issue to report. But a complete
report, for all packages/defconfigs/failures goes to the mailing list.

For this particular fastd CVE issue, what needs to be added is (1) the
proper CPE identifier information in the Buildroot package and (2) get
the NVD database maintainers to fix the CVE entry to indicate which
fastd version has fixed the security vulnerability.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
