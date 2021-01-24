From: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 24 Jan 2021 16:51:31 +0100
Subject: [Buildroot] [PATCH 1/3] package/sysklogd: bump to verson 2.2.0
In-Reply-To: <20210124152831.GA2325@scaer>
References: <20210122154333.1927190-1-troglobit@gmail.com>
 <20210122154333.1927190-2-troglobit@gmail.com>
 <20210124093641.GJ926565@scaer> <87zh0yuzpy.fsf@gmail.com>
 <20210124152831.GA2325@scaer>
Message-ID: <87pn1uuyd8.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Yann!

On Sun, Jan 24, 2021 at 16:28, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> On 2021-01-24 16:22 +0100, Joachim Wiberg spake thusly:
>> I apologize for the confusion and head scratching this has caused!
> No need for an apology ;-)

You're too kind :)

>> I see, for past sysklogd that worked.  Now we provide the logger tool
>> as well, and --exec-prefix=/ changes to /bin/logger and /sbin/syslogd.
>> Since BusyBox logger is in /usr/bin,
> Ah, this is the kind of explanations that should go in a commit message!

Yup

> Indeed, a commit message that just describes the changes is not very
> helpful. What is important in a commit message is to explain what the
> problem is and why the change fixes it.

This is exactly what I'm preaching to our junior devs (sometimes on a
daily basis) at $DAYJOB.  So it's a painful realization that when push
comes to shove, I'm no better myself LOL :-)


Best regards
 /Joachim
 
