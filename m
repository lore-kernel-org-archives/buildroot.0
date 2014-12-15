From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 15 Dec 2014 09:27:37 -0500
Subject: [Buildroot] [PATCH] erlang: bump to version 17.4
In-Reply-To: <87mw6pmmk2.fsf@dell.be.48ers.dk>
References: <1418411483-29636-1-git-send-email-fhunleth@troodon-software.com>
 <87vblfrkao.fsf@dell.be.48ers.dk> <87mw6pmmk2.fsf@dell.be.48ers.dk>
Message-ID: <CA+-urNSCA9fjcOoT46FSV81168k1wHvwB=8tcKshuJwUgpx=xQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 15, 2014 at 1:53 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>
>>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:
>  >> Erlang/OTP 17.4 is a service release on the 17 track with mostly bug
>  >> fixes, but it does contain a number of new features and characteristics
>  >> improvements as well.
>
>  >> Some highlights of the release are:
>
>  >> - eldap: Nearly all TCP options are possible to give in the
>  >> eldap:open/2 call.
>  >> - ssh: Added API functions ptty_alloc/3 and ptty_alloc/4, to allocate a
>  >> pseudo tty.
>  >> - ssl: Handle servers that may send an empty SNI extension to the client.
>
>  >> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>
>  > Committed, thanks.
>
> It seems to cause some build issues on ARM. Care to take a look?
>
> http://autobuild.buildroot.net/?reason=erlang-17.4

Ugh, it worked on my ARM. :( I'll see if I can figure out the issue
when I get a chance later today.

Thanks,
Frank
