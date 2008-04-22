From: Rex Ashbaugh <rexa@xeratech.com>
Date: Tue, 22 Apr 2008 08:45:26 -0700
Subject: [Buildroot] Error:"Staging_dir/lib/libc.so.0: could not read
	symbols:file in wrong format" while "make" buildroot with
	xscale, gcc-4.2.3
In-Reply-To: <1208876655.480dfe6f0bef5@www.server101.com>
References: <1208876655.480dfe6f0bef5@www.server101.com>
Message-ID: <6311fe0b0804220845q232b2ce3h41713d533eeb40f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Try performing the last failing operation again (move to the correct
directory and copy the last command from the console window, then execute
it)
while also inserting the --verbose flag (or whatever the verbose flag is).
This may give you a few more clues.
-Rex


On Tue, Apr 22, 2008 at 8:04 AM, Li Liang <li.liang@neomeridian.com> wrote:

> I have struggled with this problem for few days. Actually I found a
> similar
> subject in
>
> http://busybox.net/lists/buildroot/2007-October/005854.html
>
> However, I checked the mentioned patch in that thread, it actually applied
> to
> the gcc-4.2.3. Unfortunately, the issue wasn't be solved. Moreover, I
> couldn't
> find further useful info regarding to this problem. I really appreciate if
> anyone could tell me the solution. If any further log or info could help
> to
> diagnose this issue,please don't hesitate to ask me. Thank you very much
> in
> advance.
>
> ~LL
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080422/1a9ccaa5/attachment.htm 
