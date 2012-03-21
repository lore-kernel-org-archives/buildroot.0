From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Mar 2012 23:02:59 +0100
Subject: [Buildroot] [PATCH v2] ushare: new package
In-Reply-To: <94962598dfb4a528705badba7bcf7f89@zacarias.com.ar> (Gustavo
 Zacarias's message of "Wed, 21 Mar 2012 11:15:36 -0300")
References: <1332335538-23508-1-git-send-email-gustavo@zacarias.com.ar>
 <20120321142102.5c5999a6@skate>
 <5f0396764c1dc201f01ae3853a534d33@zacarias.com.ar>
 <20120321144452.68029160@skate>
 <94962598dfb4a528705badba7bcf7f89@zacarias.com.ar>
Message-ID: <871uol4nos.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> And it is wrong. Not your fault, of course, but I don't think it is
 >> an argument to make it wrong in other places as well.

 Gustavo> I was just saying that many others will require attention to
 Gustavo> that also if the consensus is to do so (with ffmpeg being the
 Gustavo> configure daddy of ushare as a direct example of it).

In general I think we should only use AUTOTARGETS for packages really
using auto*. It might work today and save a few lines, but chances are
that it will break some time in the future.

-- 
Bye, Peter Korsgaard
