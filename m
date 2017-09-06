From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 14:51:15 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: bump to version 9.6.5
In-Reply-To: <20170905122010.19409-6-aduskett@gmail.com> (Adam Duskett's
 message of "Tue, 5 Sep 2017 08:20:10 -0400")
References: <20170905122010.19409-1-aduskett@gmail.com>
 <20170905122010.19409-6-aduskett@gmail.com>
Message-ID: <878thsdm7w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

It would have been good to mention that 9.6.4 fixed a number of security
issues:

https://www.postgresql.org/about/news/1772/

Committed to 2017.02.x after extending the commit message with this info, thanks.

-- 
Bye, Peter Korsgaard
