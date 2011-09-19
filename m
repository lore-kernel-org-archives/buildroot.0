From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Sep 2011 10:14:24 +0200
Subject: [Buildroot] [git commit] support: move patch-kernel.sh and
	rename it
In-Reply-To: <1316418273.3064.4.camel@sven> (Sven Neumann's message of "Mon,
 19 Sep 2011 09:44:33 +0200")
References: <20110917063643.361CC8D728@busybox.osuosl.org>
 <1316418273.3064.4.camel@sven>
Message-ID: <87obyh54pr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> On Sat, 2011-09-17 at 08:22 +0200, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=59a326b934737483531c49c99acda7874c72e335
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> The name "patch-kernel.sh" is a bit stupid, since this script is used
 >> to patch everything in Buildroot, not only kernel trees.

 Sven> The file boot/barebox/barebox.mk still has a reference to 
 Sven> toolchain/patch-kernel.sh

Ahh yes, will fix - Thanks!

-- 
Bye, Peter Korsgaard
