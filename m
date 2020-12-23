From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 13:15:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/rauc: fix build with headers <
 4.14
In-Reply-To: <87v9csj3c6.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 23 Dec 2020 10:09:45 +0100")
References: <20201222111012.1641693-1-fontaine.fabrice@gmail.com>
 <87v9csj3c6.fsf@dell.be.48ers.dk>
Message-ID: <875z4siuqp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/829ae7ed66686c11a941ac99bd08a06f754affb4

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Thanks. I see that upstream mentions that this code will fail at runtime
 > with old kernels, so that is no good. Looking at the code I do see that
 > it explicitly ignores a failure to set the block size though.

 > I am not sure why it is so important to set to block size to 4k, and if
 > this is only for the new dm-verity based format.

 > I'll give upstream a bit of time to reply before handling this patch.

Seems upstream was just confused and the fix is good, so:

Committed, thanks.

-- 
Bye, Peter Korsgaard
