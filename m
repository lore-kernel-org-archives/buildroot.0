From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Sep 2019 17:26:36 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] qt5base: Add patch to
 fix compile issue with gcc9
In-Reply-To: <20190919073529.30254-1-julien.beraud@orolia.com> ("Julien
 =?utf-8?Q?B=C3=A9raud=22's?= message of "Thu, 19 Sep 2019 07:36:05 +0000")
References: <20190919073529.30254-1-julien.beraud@orolia.com>
Message-ID: <87ef0c1f4j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien B?raud <julien.beraud@orolia.com> writes:

 > Backport:
 > https://github.com/qt/qtbase/commit/a52d7861edfb5956de38ba80015c4dd0b596259b#diff-0b4819f9df9c43297ba840d1ac401599
 > Signed-off-by: Julien Beraud <julien.beraud@orolia.com>

Ehh, I got a bit confused first as this looked like a git commit
notification.

Why would this be applicable for 2019.02.x? We don't offer gcc9 support
in 2019.02.x.

-- 
Bye, Peter Korsgaard
