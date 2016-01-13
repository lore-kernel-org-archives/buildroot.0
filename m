From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 21:40:44 +0100
Subject: [Buildroot] [git commit] support/scripts/size-stats: fix
	copy/paste error in ArgumentParser
In-Reply-To: <20160113153749.0C60682749@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 13 Jan 2016 16:35:19 +0100")
References: <20160113153749.0C60682749@busybox.osuosl.org>
Message-ID: <8760yx5i2b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=a059055c5241ff69bd3b2f32088d03bf2a0f611e
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > A copy/paste error in the ArgumentParser() constructor call disclosed
 > the fact that the author of the script has shamefully based his work
 > on the existing graph-build-time script. This commit fixes this
 > mistake, therefore hiding in a better way how size-stats was
 > vampirized from graph-build-time.

Heh ;)

-- 
Bye, Peter Korsgaard
