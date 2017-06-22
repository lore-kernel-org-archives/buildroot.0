From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 11:27:51 +0200
Subject: [Buildroot] [PATCH] libcurl: bump version to 7.54.1
In-Reply-To: <20170621203057.4346-4-aduskett@codeblue.com> (Adam Duskett's
 message of "Wed, 21 Jun 2017 16:30:53 -0400")
References: <20170621203057.4346-1-aduskett@codeblue.com>
 <20170621203057.4346-4-aduskett@codeblue.com>
Message-ID: <87a850jrs8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Signed-off-by: Adam Duskett <aduskett@codeblue.com>

It would have been good to have a more detailed commit
message. E.G. this fixes a security issue:

https://curl.haxx.se/docs/adv_20170614.html

But as this issue only applies to Windows builds it doesn't need to be
backported to 2017.02.x / 2017.05.x.

-- 
Bye, Peter Korsgaard
