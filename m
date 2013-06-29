From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Jun 2013 15:26:39 -0300
Subject: [Buildroot] [PATCH] dhcpcd: unavailable for bfin and fix
 another bug
In-Reply-To: <20130629143754.184edb41@skate>
References: <1372463785-29537-1-git-send-email-gustavo@zacarias.com.ar>
 <20130629104251.4697be00@skate> <51CEBC51.9030601@zacarias.com.ar>
 <20130629125530.412858a5@skate> <51CED399.8050408@zacarias.com.ar>
 <20130629143754.184edb41@skate>
Message-ID: <51CF26DF.20406@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/29/2013 09:37 AM, Thomas Petazzoni wrote:

> Yes, of course it lacks getifaddrs, but I don't see how it changes the
> point I was making originally: it is not because /some/ external
> toolchains are affected that we should exclude an entire architecture
> from building a particular package.

Oh come on!
The ct-ng sample doesn't have UCLIBC_SUPPORT_AI_ADDRCONFIG set
(default=n in uClibc upstream).
None of Analog's toolchains have it either.
There's some old Ronetix blackfin toolchain that doesn't support it either.
So that just leaves a customized ct-ng or hand-built toolchain as a
canditate, which i take it as "very unlikely" to happen.
Regards.
