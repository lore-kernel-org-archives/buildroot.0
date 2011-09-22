From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Sep 2011 22:02:36 +0200
Subject: [Buildroot] [PATCH 5 of 5] toolchain-external: use host-tar
	instead of tar to unpack toolchains
In-Reply-To: <201109210554.57701.minimod@morethan.org>
References: <patchbomb.1316588130@localhost6.localdomain6>
 <CAAXf6LWQj65KCeCEzb-ETyFpUPqgjtxK0MZnbAfHayBx6GXE_Q@mail.gmail.com>
 <201109210554.57701.minimod@morethan.org>
Message-ID: <201109222202.37083.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 21 September 2011 12:54:55, Michael S. Zick wrote:
> That should help keep the build environment sane, with a message
> to the user if something is too old;
> And should relieve the maintainers of the task of remembering to
> "re-correct" the build system someday in the future.

 How does that help the users who are stuck on RH5?  Buildroot would still not 
work for them (although with a clearer explanation why not), so they'd have to 
implement Thomas's patches after all.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
