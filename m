From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 09:03:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/x265: bump version to 2.2
In-Reply-To: <87d1fe4tc2.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 22 Jan 2017 23:34:37 +0100")
References: <20170122145028.13360-1-bernd.kuhls@t-online.de>
 <87d1fe4tc2.fsf@dell.be.48ers.dk>
Message-ID: <87d1fekxt4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 > Committed, thanks.

This seems to cause build issues related to -mcpu=native:

http://autobuild.buildroot.net/results/fd8/fd8a35d82c3dd0e530a567317262ae8a58dbb02d/build-end.log

Care to have a look?

-- 
Bye, Peter Korsgaard
