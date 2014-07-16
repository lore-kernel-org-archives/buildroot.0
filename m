From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 20:35:40 +0200
Subject: [Buildroot] [PATCH 1/1] upmpdcli: new package
In-Reply-To: <20140714215113.GO3684@free.fr>
References: <1405371167-25884-1-git-send-email-jkrause@posteo.de>
 <20140714215113.GO3684@free.fr>
Message-ID: <20140716203540.5ec29da4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 14 Jul 2014 23:51:13 +0200, Yann E. MORIN wrote:

> > +# Upmpdcli only runs if user upmpdcli exists
> > +define UPMPDCLI_USERS
> > +	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli: MPD UPnP Renderer Front-End
> 
> You're adding this user, but nowhere do you seem to use it to run the
> upmpdcli daemon. What am I missing?

It's automatically used by the upmpdcli daemon, which expects this user
to exist, as explained by the comment above.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
