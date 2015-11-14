From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2015 09:39:18 +0100
Subject: [Buildroot] [PATCH 1/3] libsigc: bump to version 2.6.2
In-Reply-To: <56466A51.6090802@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 13 Nov 2015 19:55:13 -0300")
References: <1447437956-13035-1-git-send-email-gustavo@zacarias.com.ar>
 <87ziyhlhwp.fsf@dell.be.48ers.dk> <56466A51.6090802@zacarias.com.ar>
Message-ID: <87si49j7pl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 13/11/15 18:16, Peter Korsgaard wrote:
 >> Why is this 4.7 and the other two patches 4.8? A note about that in the
 >> commit message would be good.

 > Hi.
 > 4.7 is the minimum required for libsigc, 4.8 is the minimum for glibmm
 > and libxmlpp.
 > It's mostly related to 4.7 partially implementing C++11 features with
 > 4.8 being feature complete (or almost), based on testing.
 > We can make both match, i just didn't want to artificially bump
 > libsigc requirements.

Ok, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
