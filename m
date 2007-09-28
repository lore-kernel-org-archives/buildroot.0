From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 18:51:14 +0200
Subject: [Buildroot] Libtool error with AVR32
In-Reply-To: <20070928160919.GA10853@reid1.localdomain>
References: <20070927181757.GA8519@reid1.localdomain>
	<1190926438.5322.16.camel@elrond.atmel.sweden>
	<20070927221919.GA8983@reid1.localdomain>
	<20070927223420.GG20951@aon.at>
	<20070928160919.GA10853@reid1.localdomain>
Message-ID: <20070928165114.GM20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 28, 2007 at 09:09:19AM -0700, don wrote:

>> Don, I'm still under the impression that you're using something
>> provided by atmel and not http://buildroot.uclibc.org/
>> This is not the appropriate place for the "latest AVR32 release from
>> ATmel" but for buildroot.
>
>I'm using an archive of buildroot that Atmel provides on their website.

>Have you considered creating buildroot releases, which are frozen
>excerpt for simple bug fixes?  It seems that the rate of new "features"

Well, I'm thinking about doing this, yes. The problem with a project
like buildroot (or any distribution) is that it's a moving target per
definition. Software receives bug-fixes (upstream) or fancy features
that you may want to use, so you have to update packages sometimes.

We don't add much new "features", really. Except for huge experimental
bundles like xorg only a small number of packages are added (which is a
good thing since they cost time to keep uptodate).

cheers,
