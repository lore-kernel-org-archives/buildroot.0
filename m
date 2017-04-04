From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Apr 2017 23:45:06 +0200
Subject: [Buildroot] [PATCH] package/tyrian: fixes compilation with
	static libs.
In-Reply-To: <1491222343-29223-1-git-send-email-julien.boibessot@free.fr>
 (julien boibessot's message of "Mon, 3 Apr 2017 14:25:43 +0200")
References: <1491222343-29223-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87o9wbu9st.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 > From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
 > Has been tested with: "./support/scripts/test-pkg -c tyrian.cfg -p opentyrian"
 > Fixes: http://autobuild.buildroot.net/results/0e2345db82b33f591958fc0f72ad914adafe0522
 > and some similar previous build failure.

 > Thanks Thomas for the tip ;-).

 > Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
