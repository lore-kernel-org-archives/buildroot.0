From: Daniel James Laird <daniel.j.laird@nxp.com>
Date: Tue, 27 Jan 2009 11:15:33 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
In-Reply-To: <87zlhd15zu.fsf@macbook.be.48ers.dk>
References: <20090123174908.81999769CC@busybox.osuosl.org>
	<20090127002732.GB1083@cloud.net.au>
	<COL102-W811D43396757A885D85C94DCCB0@phx.gbl>
	<87zlhd15zu.fsf@macbook.be.48ers.dk>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F1AF38F7666@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Feel free to remove the X dependency,
I was intending to update webkit after release......

Cheers
Dan

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
Sent: 2009 Jan 27 08:57
To: Daniel Laird
Cc: hamish at cloud.net.au; buildroot at busybox.net; buildroot at uclibc.org
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/webkit

>>>>> "Daniel" == Daniel Laird <danieljlaird@hotmail.com> writes:

 Daniel> Webkit does not rely on X either, I have building just on top
 Daniel> of GTK and DirectFB.

Ahh ok. Will you fix the Kconfig stuff or should I?

 Daniel> Although I do have a slightly newer version of webkit running.

Please update the package *AFTER* the release.

-- 
Bye, Peter Korsgaard
