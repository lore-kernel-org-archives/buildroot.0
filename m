From: Arun Reddy <reddyac@gmail.com>
Date: Thu, 8 May 2008 09:08:15 -0700
Subject: [Buildroot] Bash patches not working? (bash32-025 and up)
In-Reply-To: <326f33790805080640g6f9b4c6av67b884767fea397@mail.gmail.com>
References: <326f33790805071819n32858557o187314db62ce5b26@mail.gmail.com>
	<1210223891.4822.142.camel@nigel-x60>
	<326f33790805072238s6eff6e3em9d789b1f57e598a0@mail.gmail.com>
	<1210225844.4822.143.camel@nigel-x60>
	<326f33790805080640g6f9b4c6av67b884767fea397@mail.gmail.com>
Message-ID: <326f33790805080908y71905f83k713d6895a63d32fa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The way I see it, I don't understand how removing the bash directory would
even help, considering that buildroot is building bash. It's always going to
unpack bash-3.2 and recreate that directory.

Does anyone happen to know how I can edit any .mk file properly to retrieve
these packages? I just don't understand why these patches are failing. Thank
you for all the help.

On Thu, May 8, 2008 at 6:40 AM, Arun Reddy <reddyac@gmail.com> wrote:

> It seems I am still running into the same problem. I removed bash-3.2 and
> ran make, but found the same error, so I did a make clean first then built
> again, and I see the same error. Even the bash-3.2 folder appears again. Is
> there something else? A setting within buildroot's menuconfig perhaps?
>
>
> On Wed, May 7, 2008 at 10:50 PM, Nigel Kukard <nkukard@lbsd.net> wrote:
>
>>
>> > Are you suggesting that I remove the ~/buildroot/build_arm/bash-3.2
>> > directory?
>>
>> Yep.
>>
>> -N
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080508/2b391f6d/attachment.htm 
