From: Steve Kenton <skenton@ou.edu>
Date: Mon, 09 Feb 2015 08:37:45 -0600
Subject: [Buildroot] glibc and locale
In-Reply-To: <20150209080931.147fac1c@free-electrons.com>
References: <54D7F4F8.3040005@ou.edu>
 <20150209080931.147fac1c@free-electrons.com>
Message-ID: <54D8C639.8080208@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/09/2015 01:09 AM, Thomas Petazzoni wrote:
> Dear Steve Kenton,
> 
> On Sun, 08 Feb 2015 17:44:56 -0600, Steve Kenton wrote:
>> I have a script that wants the locale program. I notice that is is already built
>> as part of the glibc build process, but it is not installed. Would there be
>> any objections to something along these lines to go ahead and install locale?
>> I'm not sure if this is the best way since glibc build uses autotools.
> 
> This looks ok, but I am wondering how that would be done with the
> uClibc and musl C libraries. Remember that we support three different C
> libraries, so when we're doing a change to one of them, we always need
> to check what needs to be done for the two other ones.
OK, I'll take a look at the other two.

Steve Kenton

> 
> Best regards,
> 
> Thomas Petazzoni
> 
