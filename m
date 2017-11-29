From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 29 Nov 2017 21:25:12 +0100
Subject: [Buildroot] [PATCH] package/google-breakpad: replace references
 to 'struct ucontext' with 'ucontext_t'
In-Reply-To: <04e7418d-735d-c9b3-3087-dbe78529cc48@mind.be>
References: <20171122210828.19311-1-romain.naour@gmail.com>
 <20171122224529.5190424d@windsurf.lan>
 <04e7418d-735d-c9b3-3087-dbe78529cc48@mind.be>
Message-ID: <3ab693ad-f987-e7ff-85fc-ee1463584f31@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 23/11/2017 ? 23:59, Arnout Vandecappelle a ?crit?:
> 
> 
> On 22-11-17 22:45, Thomas Petazzoni wrote:
>> Hello,
>>
>> Thanks for working on this topic!
>>
>> On Wed, 22 Nov 2017 22:08:28 +0100, Romain Naour wrote:
>>> Glibc change:
>>> https://sourceware.org/git/?p=glibc.git;h=251287734e89a52da3db682a8241eb6bccc050c9
>>
>> This commit log is very, very terse. Could you explain in more details
>> what's going on?
>>
>> Also, what is the effect if you use an older glibc version than 2.26 ?
> 
>  The ucontext_t type name is POSIX and has existed in glibc since 1997, in
> uClibc and musl forever.
> 
>  I've extended the commit log with this and more explanation, and applied to
> master, thanks.

Thanks for the improved commit log :)

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
