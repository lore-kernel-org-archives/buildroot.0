From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Dec 2012 23:59:20 +0100
Subject: [Buildroot] Packet menu: X.org X Window System
In-Reply-To: <20121226094719.64380938@skate> (Thomas Petazzoni's message of
 "Wed, 26 Dec 2012 09:47:19 +0100")
References: <20121226022529.GA5440@zuhnb712.ap.bm.net>
 <20121226094719.64380938@skate>
Message-ID: <87ip7o5sjb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> In fact, the X.org server can be compiled in two different flavors:

 Thomas>  * The modular X.org flavor, which is the one used on virtually all
 Thomas>    Linux distributions. In this flavor, the device drivers (video,
 Thomas>    input, etc.) are compiled separately from the X.org server and can
 Thomas>    be dynamically loaded.

 Thomas>  * The TinyX variant, in which drivers are directly bundled into the X
 Thomas>    server. Those drivers are more limited (in number), and are directly
 Thomas>    part of the X.org server code base (as opposed to the modular X.org,
 Thomas>    where each driver is a separate project, separate tarball.

Also notice that Tinyx/kdrive is deprecated, and there's been talks
about completely removing it several times, most recently afaik was:

http://lists.x.org/archives/xorg-devel/2012-March/030059.html

 Thomas> It would probably be more clear to have the Server Type
 Thomas> selection as a sub-option of the X.org server selection.

Agreed.

-- 
Bye, Peter Korsgaard
