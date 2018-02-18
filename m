From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Feb 2018 21:08:51 +0100
Subject: [Buildroot] Build error for lz4 package on x86-64 (buildroot
 2017.02.10)
In-Reply-To: <87inaxl2ht.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 16 Feb 2018 10:15:10 +0100")
References: <CAKH+9mwNZHORzcWssYX3fKeRCke7YN9xNPwZ4AMH9B-UZhmO-g@mail.gmail.com>
 <87inaxl2ht.fsf@dell.be.48ers.dk>
Message-ID: <87a7w6kqlo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 > Thanks for the heads up. Looking at the history, this is because that
 > commit was backported to 2017.02.x, but not the commit bumping the lz4
 > version to 1.7.5.

 > Looking at the r131 makefiles, it looks like the lz4programs target
 > doesn't build lz4c, which was the reason for the change - So perhaps a
 > better solution is to simply bump the lz4 version to 1.7.5?

I've now cherry picked the version bump to 1.7.5 to the 2017.02.x branch
and it will be included in the upcoming 2017.02.11 release - Thanks!

-- 
Bye, Peter Korsgaard
