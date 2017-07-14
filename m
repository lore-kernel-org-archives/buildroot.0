From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jul 2017 15:13:29 +0200
Subject: [Buildroot] [PATCH] nginx-upload: bump version to fix build
	against nginx-1.12.x
In-Reply-To: <20170714092032.18788-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 14 Jul 2017 11:20:32 +0200")
References: <20170714092032.18788-1-peter@korsgaard.com>
Message-ID: <87fudzb1qe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/9ec/9ecf714667736bf61f643ad55588d3d6ebdde603/
 > http://autobuild.buildroot.net/results/cea/cea64e30e98543e10c8819f6337babfec6d7ac0f/

 > Bump to the latest commit on the 2.255 branch, which contains pull request
 > 88 (work with latest nginx versions):

 > https://github.com/vkholodkov/nginx-upload-module/pull/88

 > git shortlog aba1e3f34c754551f4f49e572bc86863d535609d..
 > Anton (1):
 >       Add files via upload

 > Valery Kholodkov (5):
 >       Added tag for version 2.0.8
 >       Recreated tag for version 2.0.8
 >       Backported to nginx 0.5.37 by Anthony Kholodkov
 >       Updated Changelog
 >       Merge pull request #88 from antonbarinov/2.255

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
