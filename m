From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 17:06:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/ninja: remove
 fdiagnostics-color from make command
In-Reply-To: <20200203155117.1972331-1-aduskett@gmail.com> (Adam Duskett's
 message of "Mon, 3 Feb 2020 07:51:17 -0800")
References: <20200203155117.1972331-1-aduskett@gmail.com>
Message-ID: <87zhdz1wpq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > -fdiagnostics-color was introduced in gcc 4.9 and the minimum supported version
 > that Buildroot supports is 4.8.

 > Fixes:
 > http://autobuild.buildroot.net/results/e5a02faa75345009e7cdcbf9d693199bee4741aa
 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Slightly tweaked the commit message and committed, thanks.

-- 
Bye, Peter Korsgaard
