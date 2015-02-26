From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 00:18:02 +0100
Subject: [Buildroot] [PATCH v1] directfb-examples: explicitly add
	-lstdc++ for static build
In-Reply-To: <1424900145-26962-2-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Wed, 25 Feb 2015 22:35:45 +0100")
References: <1424900145-26962-1-git-send-email-ps.report@gmx.net>
 <1424900145-26962-2-git-send-email-ps.report@gmx.net>
Message-ID: <8761ao45zp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1] and [2]:
 > undefined reference to `___cxa_pure_virtual'
 > undefined reference to `___gxx_personality_v0'

 > [1] http://autobuild.buildroot.net/results/bd0/bd0f4b3e41bf6330f83e3d9b58d985cc63506a3b/
 > [2] http://autobuild.buildroot.net/results/584/584ace383204d97fcaad37742e2e035ca78a3d10/

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

I've also committed a change to drop the local stripping from the
package.

-- 
Bye, Peter Korsgaard
