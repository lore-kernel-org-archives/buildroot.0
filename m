From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Mar 2014 23:41:57 +0100
Subject: [Buildroot] [PATCH 6/6] toolchain-external: add Linaro ARM big
 endian toolchain
In-Reply-To: <20140306233051.7f4add0c@skate>
References: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1394058220-5863-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <877g87t18s.fsf@dell.be.48ers.dk> <20140306233051.7f4add0c@skate>
Message-ID: <20140306224157.GI3625@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-06 23:30 +0100, Thomas Petazzoni spake thusly:
> On Thu, 06 Mar 2014 23:23:47 +0100, Peter Korsgaard wrote:
> >  > Linaro has started to release ARM big endian toolchains, so we
> >  > integrate this toolchain in the external toolchain logic of
> >  > Buildroot. Since ARM big endian is probably going to be a lot more
> >  > confidential than ARM little endian, we will only support one version
> > 
> > confidential? Do you mean 'specialized' or 'uncommon'?
> 
> Yes. In French "confidentiel" has two different meanings: it might mean
> "secret", or when talking about the usage, it can mean "rarely". I'll
> change to "uncommon", which is certainly better.

In english, "confidential" has the same meaning. It's even the first
listed in the Merriam Webster:

    http://www.merriam-webster.com/dictionary/confidential

    1. marked by intimacy or willingness to confide

But agreed, "uncommon" is easier to grok.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
