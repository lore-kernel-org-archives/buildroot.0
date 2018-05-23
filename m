From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 May 2018 08:01:43 +0200
Subject: [Buildroot] [git commit branch/next] systemd: add optional
 dependency on libidn2
In-Reply-To: <CAPi7W80i7hYppmX2fnOTcZEThcXT7cA538Aaz9bOFBHdmJMPCQ@mail.gmail.com>
References: <20180520141552.91B5181239@busybox.osuosl.org>
 <726bd387-4b74-faba-bb22-e6a0edc3291a@mind.be>
 <CAPi7W80i7hYppmX2fnOTcZEThcXT7cA538Aaz9bOFBHdmJMPCQ@mail.gmail.com>
Message-ID: <20180523080143.65f792f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 May 2018 23:49:38 +0200, Fabrice Fontaine wrote:

> > > -SYSTEMD_CONF_OPTS += -Dlibidn=false
> > > +SYSTEMD_CONF_OPTS += -Dlibidn=false -Dlibidn2=true  
> >
> >  Shouldn't this be -Dlibidn2=false ?
> >  
> Indeed, you're completly right, thanks for spotting the mistake.

It's not your fault I believe, but mine. I reworked this patch of your
patch when applying and got it wrong.

I've pushed a commit that fixes that. Thanks Arnout for spotting, and
sorry Fabrice for this mistake :/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
