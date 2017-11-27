From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 10:33:44 +0100
Subject: [Buildroot] [PATCH 2/2] qt5webkit: backport upstream icu-59 fix
 from 5.9 branch to 5.6.3
In-Reply-To: <20171116142305.29500-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 16 Nov 2017 15:23:05 +0100")
References: <20171116142305.29500-1-peter@korsgaard.com>
 <20171116142305.29500-2-peter@korsgaard.com>
Message-ID: <87fu90cbgn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > icu-59.x slightly changed the API, breaking qt5webkit builds. For details, see:
 > https://bugreports.qt.io/browse/QTBUG-60532

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
