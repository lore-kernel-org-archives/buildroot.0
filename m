From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2019 22:26:14 +0100
Subject: [Buildroot] [PATCH 01/11] support/download: fix scp downloads
In-Reply-To: <CAAXf6LU6m9WnwztW6bVOxobwFkpVi3TBUAJc8pWNxJR5s8HfNg@mail.gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-2-patrickdepinguin@gmail.com>
 <20190103205518.GB5991@scaer>
 <CAAXf6LU6m9WnwztW6bVOxobwFkpVi3TBUAJc8pWNxJR5s8HfNg@mail.gmail.com>
Message-ID: <20190103212614.GD5991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-03 22:03 +0100, Thomas De Schampheleire spake thusly:
> On Thu, Jan 3, 2019, 21:55 Yann E. MORIN < [1]yann.morin.1998@free.fr wrote:
>   This is not an URL, but an URI, and even then, this is only the
>   authority part [0] of the URI. ;-) But, Oh well... I'm bikeshedding
>   here, so:
> The differences between URL and URI have never been really clear to me.
> So from the link, URI is the generic term and URL is a type of URI??

Don't bother: in all practicality, they are useable interchangeably in
the contexts we are most dealing with here. And as I wrote: I was really
just bikeshedding (well, I should have rather said that I were being
pedantic, but this would be starting to be a bit meta now...).

Regards,
Yann E. MORIN.

> And because this -u argument does not refer to one resource but a server hosting multiple resources, it cannot be a URL?
> Thanks,
> Thomas
> 
> Links:
> 1. mailto:yann.morin.1998 at free.fr
> 2. mailto:thomas.de_schampheleire at nokia.com
> 3. mailto:thomas.de_schampheleire at nokia.com
> 4. mailto:yann.morin.1998 at free.fr
> 5. https://en.wikipedia.org/wiki/Uniform_Resource_Identifier#Generic_syntax

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
