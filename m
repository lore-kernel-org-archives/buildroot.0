From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 12:37:43 +0100
Subject: [Buildroot] [PATCH 1/2] xenomai: remove unnecessary autoreconf
In-Reply-To: <20190108203854.28015-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 8 Jan 2019 21:38:53 +0100")
References: <20190108203854.28015-1-patrickdepinguin@gmail.com>
Message-ID: <87r2d2ffqw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > As xenomai release tarballs ship with a configure script, there is only a
 > need for autoreconfiguring when patches are applied.

 > The last patch was removed with git commit
 > de993bc23aab100e16026cb4cabebed48b9e1989 but the AUTORECONF line remained.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
