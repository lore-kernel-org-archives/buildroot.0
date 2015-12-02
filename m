From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Dec 2015 22:58:42 +0000
Subject: [Buildroot] [Bug 8066] nodejs crashes when built with gcc 4.9
In-Reply-To: <bug-8066-163@https.bugs.busybox.net/>
References: <bug-8066-163@https.bugs.busybox.net/>
Message-ID: <bug-8066-163-G7pcntx3vV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8066

--- Comment #8 from Martin <martin@barkynet.com> ---
(In reply to Jeroen Roovers from comment #6)
> On an ARM system (cortex-a7) I am seeing a similar problem when I build
> everything with gcc-4.9.*. It doesn't crash, though, it merely exits certain
> functions early, causing it to output invalid HTTP headers. I have seen some
> references on the wider Internet pointing to similar problems, but those
> were not connected to a specific GCC version or even the same OS. The only
> thing I am certain of is that GCC 4.9 miscompiles nodejs, including version
> 4.1.1. I haven't tried with libuv and libhttpparser properly in place,
> though.

I think this might be a different issue, the original issue is about a crash.  

If you think you still have an issue can you please raise a new bug.  In the
bug please attach a minimal non-working Buildroot configuration so we can try
to reproduce it.  

Thanks

Martin

-- 
You are receiving this mail because:
You are on the CC list for the bug.
