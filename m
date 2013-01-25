From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Jan 2013 15:48:32 +0100
Subject: [Buildroot] Where did fs/skeleton go ?
In-Reply-To: <510284B4.4070402@petroprogram.com> ("Stefan =?utf-8?Q?Fr?=
 =?utf-8?Q?=C3=B6berg=22's?= message
 of "Fri, 25 Jan 2013 15:12:20 +0200")
References: <510284B4.4070402@petroprogram.com>
Message-ID: <87a9rxgvy7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:

 Stefan> Hello everyone

 Stefan> Got the latest git of buildroot and noticed that fs/skeleton
 Stefan> dir is missing.  Where did it go ?

It was moved back from fs/ to system/ in early November (E.G. before
2012.11) as mentioned in the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11_rc1

-- 
Bye, Peter Korsgaard
