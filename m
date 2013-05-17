From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 May 2013 20:01:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-05-16
In-Reply-To: <20130517063004.5C9B352C0F6@lolut.humanoidz.org>
References: <20130517063004.5C9B352C0F6@lolut.humanoidz.org>
Message-ID: <20130517200122.42592574@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 May 2013 08:30:04 +0200 (CEST), Thomas Petazzoni wrote:
> Build statistics for 2013-05-16
> ===============================
> 
>         success : 79 
>        failures : 47 
>        timeouts : 3  
>           TOTAL : 129

I have augmented the timeout duration from 2 hours to 4 hours, which
should hopefully help get rid of those false positives.

Some of the failures on the Free Electrons build server were due to a
lack of disk space (or more precisely, my user reaching its disk
quota). I've freed some disk space earlier today, before I restarted
the automated builds (which had stopped since about 10 PM CEST due to a
reboot after a kernel upgrade).

Also, I propose to remove the timeouts from the list of failures in the
automated e-mail, and only list them in the success/failures/timeouts
summary above. They're just noise in the list of failures. Any
objection to this?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
