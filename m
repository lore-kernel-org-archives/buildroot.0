From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Apr 2017 23:15:09 +0200
Subject: [Buildroot] [PATCH] package/tyrian: fixes compilation with
	static libs.
In-Reply-To: <20170403143329.7431c8b4@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 3 Apr 2017 14:33:29 +0200")
References: <1491222343-29223-1-git-send-email-julien.boibessot@free.fr>
 <20170403143329.7431c8b4@free-electrons.com>
Message-ID: <871st7vpr6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon,  3 Apr 2017 14:25:43 +0200, julien.boibessot at free.fr wrote:
 >> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
 >> 
 >> Has been tested with: "./support/scripts/test-pkg -c tyrian.cfg -p opentyrian"
 >> Fixes: http://autobuild.buildroot.net/results/0e2345db82b33f591958fc0f72ad914adafe0522
 >> and some similar previous build failure.
 >> 
 >> Thanks Thomas for the tip ;-).
 >> 
 >> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
 >> ---
 >> package/opentyrian/opentyrian.mk | 2 +-

I know it is too late now, but subject should have said
package/opentyrian, not package/tyrian.

-- 
Bye, Peter Korsgaard
