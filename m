From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 19:55:13 -0300
Subject: [Buildroot] [PATCH 1/3] libsigc: bump to version 2.6.2
In-Reply-To: <87ziyhlhwp.fsf@dell.be.48ers.dk>
References: <1447437956-13035-1-git-send-email-gustavo@zacarias.com.ar>
 <87ziyhlhwp.fsf@dell.be.48ers.dk>
Message-ID: <56466A51.6090802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/15 18:16, Peter Korsgaard wrote:

> Why is this 4.7 and the other two patches 4.8? A note about that in the
> commit message would be good.

Hi.
4.7 is the minimum required for libsigc, 4.8 is the minimum for glibmm 
and libxmlpp.
It's mostly related to 4.7 partially implementing C++11 features with 
4.8 being feature complete (or almost), based on testing.
We can make both match, i just didn't want to artificially bump libsigc 
requirements.
Regards.
