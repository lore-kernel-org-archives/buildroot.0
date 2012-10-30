From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Oct 2012 14:23:15 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.2.3
In-Reply-To: <87txtcgckd.fsf@macbook.be.48ers.dk>
References: <1351544236-23479-1-git-send-email-gustavo@zacarias.com.ar>
 <87txtcgckd.fsf@macbook.be.48ers.dk>
Message-ID: <50900D03.8000304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/30/12 13:16, Peter Korsgaard wrote:

> This seems to have caused some build failures:
> 
> http://autobuild.buildroot.net/results/c9e590a1034c3869cb7391984ce8281ec4c3ef9c/build-end.log
> 
> http://autobuild.buildroot.net/results/7f8201ebcafd611cab95788e030b768fa84ad28b/build-end.log
> 
> The 2nd you can probably not do much about though.

Give the patch i've sent a try, it should fix the first one.
Yes, not much we can do about heavy C++ code breaking some toolchain guts...
Regards.
