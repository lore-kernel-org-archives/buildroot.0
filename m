From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Mar 2016 02:40:52 +0000
Subject: [Buildroot] [Bug 8751] make fail
In-Reply-To: <bug-8751-163@https.bugs.busybox.net/>
References: <bug-8751-163@https.bugs.busybox.net/>
Message-ID: <bug-8751-163-jVre7GrvVe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8751

rootkiter <rootkiter@rootkiter.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Target Milestone|---                         |2016.02
            Version|unspecified                 |2015.11
           Hardware|All                         |PC

--- Comment #3 from rootkiter <rootkiter@rootkiter.com> ---
Sorry for @Thomas Petazzoni ,from China...

I thouht
http://autobuild.buildroot.net/results/578/578ae9da10d017ee9e2c15d37014f31a1114ef3a/
 has the bug config...
so I don't need put it up...

I tested all most buildroot version from 2015 begin,all has this bug...

On the "make menuconfig"... I just chose 
```
Target packages -> 
    Debugging,profiling and benchmark -> 
       [*]fio
```

Then,this bug showed up...Cancle it,every thing is good..

My build target is "SuperH : ELF : sh4(SH4 little endian)"

I just want get a "gdb && gdbserver(static) for SuperH",
And I didn't find other items for gdb..
I thought I need this Item...


PS:This is my first time report a bug to "Open source project"...
so,I am realy don't know how to upload the .config file,
and how to descript it...
Maybe,Someone can give me an URL of "help page" for report the bugs...
The Community will thank you for bringing a new person there...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
