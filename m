From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Mar 2020 15:01:11 +0100
Subject: [Buildroot] Buildroot 2019.02.10 released
In-Reply-To: <VI1PR02MB3920FB98760F53590B4F735BDCF60@VI1PR02MB3920.eurprd02.prod.outlook.com>
 (Mircea GLIGA's message of "Tue, 17 Mar 2020 13:50:06 +0000")
References: <87tv2orn3o.fsf@dell.be.48ers.dk>
 <VI1PR02MB3920FB98760F53590B4F735BDCF60@VI1PR02MB3920.eurprd02.prod.outlook.com>
Message-ID: <87pndbrsgo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mircea" == Mircea GLIGA <mgliga@bitdefender.com> writes:

 > Hi all,
 >> - Br2-external: Fix compatibility with make 4.3+

 > Regarding this part, there is a problem, the fix that applies to master, doesn't fix
 > the problem on 2019.02.X.
 > I reported this when I tested the problem here: 
 > http://lists.busybox.net/pipermail/buildroot/2020-March/275751.html

 > The fix on this branch should be:

 > `$(BASE_DIR)/.br-external.mk:;`

Damn, sorry about that. I've pushed a fix to the 2019.02.x branch which
will be included in 2019.02.11.

-- 
Bye, Peter Korsgaard
