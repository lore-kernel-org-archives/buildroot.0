From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Dec 2015 22:26:19 +0100
Subject: [Buildroot] [PATCH 1/1] mongoose: bump to version 6.1
In-Reply-To: <1449347746-13496-1-git-send-email-zinosat@tiscali.it> (Davide
 Viti's message of "Sat, 5 Dec 2015 21:35:45 +0100")
References: <1449347746-13496-1-git-send-email-zinosat@tiscali.it>
Message-ID: <87h9jqhu6c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Davide" == Davide Viti <zinosat@tiscali.it> writes:

 >  - the example does not accept optional parameters anymore
 >  - listening port is now forced to 8000

That's a bit of a pain :/

Looking at the examples, restful_server seems closer to the old
web_server example, doesn't it?

According to the release notes, the API has changed in the 6.x
series. Have you verified that the reverse dependencies of mongoose
(E.G. swupdate) still build/work?

-- 
Bye, Peter Korsgaard
