From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 28 Sep 2007 22:42:48 +0300
Subject: [Buildroot] Libtool error with AVR32
In-Reply-To: <20070928165114.GM20951@aon.at>
References: <20070927181757.GA8519@reid1.localdomain>	<1190926438.5322.16.camel@elrond.atmel.sweden>	<20070927221919.GA8983@reid1.localdomain>	<20070927223420.GG20951@aon.at>	<20070928160919.GA10853@reid1.localdomain>
	<20070928165114.GM20951@aon.at>
Message-ID: <46FD5938.303@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Well, I'm thinking about doing this, yes. The problem with a project
> like buildroot (or any distribution) is that it's a moving target per
> definition. Software receives bug-fixes (upstream) or fancy features
> that you may want to use, so you have to update packages sometimes.
> 
> We don't add much new "features", really. Except for huge experimental
> bundles like xorg only a small number of packages are added (which is a
> good thing since they cost time to keep uptodate).
> 

I think it would be good to create a -testing branch and to push in this
branch fixes and additions. And main branch keep stable as possible.

Also it would be useful to create something like this "http://kegel.com/crosstool/crosstool-0.43/buildlogs/"
but for package/target status.

I can help if we decide to do something in that direction.

Best regards,
Ivan

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
