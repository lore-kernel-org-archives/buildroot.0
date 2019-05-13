From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 13:31:46 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-08
In-Reply-To: <8fd5700b-d81b-71da-7edb-c32248a32a4f@free.fr>
References: <20190509060042.1026E872A2@whitealder.osuosl.org>
 <20190509230324.0b03746e@windsurf.home>
 <8fd5700b-d81b-71da-7edb-c32248a32a4f@free.fr>
Message-ID: <20190513133146.7a011b13@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 May 2019 13:20:54 +0200
Julien Boibessot <julien.boibessot@free.fr> wrote:

> I have already brought this problem up a few times before but no one has
> a clue.
> My build system is consuming 100% CPU in conftest process when building
> libsodium.
> 
> In this state I have to manually kill all conftest processes otherwise
> the build is blocked for days... :-)

Which configure test is it running when it's blocked ? What does
"strace" says about this conftest process that is stuck ?

Can  you reproduce manually ? Does it happen every time libsodium is
built on your machine, or only once in a while ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
