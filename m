From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 08:33:44 +0100
Subject: [Buildroot] [PATCH 1/7] imagemagick: add patch to fix libxml2
 issue and remove useless patch
In-Reply-To: <871v59v7ag.fsf@macbook.be.48ers.dk>
References: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
	<cover.1293038710.git.thomas.petazzoni@free-electrons.com>
	<8f23282ed90aabed67682d1f85470571c5ea056d.1293038710.git.thomas.petazzoni@free-electrons.com>
	<871v59v7ag.fsf@macbook.be.48ers.dk>
Message-ID: <20101223083344.1d0573cd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Dec 2010 22:15:03 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> The patch imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch
>  Thomas> was not applied anymore due to a difference in the version number, and
>  Thomas> it didn't prevent imagemagick to be built. It was introduced several
>  Thomas> years ago together with the ImageMagick package itself, so presumably
>  Thomas> it is no longer needed.
> 
> Committed, thanks - Please send the xml2-config patch upstream.

Tried yesterday, but their list is not-open to non-subscribers. Will
have to subscribe.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
