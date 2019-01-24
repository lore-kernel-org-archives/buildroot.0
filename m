From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 24 Jan 2019 10:54:10 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/2] syslog-ng: fix builds with static libc
In-Reply-To: <CAFOYHZAUKvTXjxQfx6rRWrdJ-=uqhvmb04ZXR=bc7r+9FQZeqw@mail.gmail.com>
References: <20190119071947.5472-1-judge.packham@gmail.com>
 <CAFOYHZAUKvTXjxQfx6rRWrdJ-=uqhvmb04ZXR=bc7r+9FQZeqw@mail.gmail.com>
Message-ID: <1721988266.3734002.1548334450658.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Chris Packham" <judge.packham@gmail.com>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "Carlos Santos" <casantos@datacom.com.br>
> Sent: S?bado, 19 de janeiro de 2019 5:28:16
> Subject: Re: [PATCH 1/2] syslog-ng: fix builds with static libc

> On Sat, Jan 19, 2019 at 8:20 PM Chris Packham <judge.packham@gmail.com> wrote:
>>
>> Bring in an upstream patch to fix builds for targets which lack dlfcn.h.
>>
> 
> Probably should have added
> 
> Fixes:
> -
> http://autobuild.buildroot.net/results/c0bca852e053cd0e021205b3a949e750ae602333/
> 
> Let me know if you want me to send a v2.

Yes, please. I also believe that all files should be updated in a single
patch, since the change in Config.in does not make sense without the other
ones.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
