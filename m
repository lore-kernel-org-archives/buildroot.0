From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jul 2017 22:59:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-07-08
In-Reply-To: <87d197tbct.fsf@dell.be.48ers.dk>
References: <20170709063052.6F78221DB3@mail.free-electrons.com>
 <480602992.4326585.1499689836292.JavaMail.zimbra@datacom.ind.br>
 <20170710144340.4fab6bd4@windsurf.lan>
 <87lgnwtoth.fsf@dell.be.48ers.dk>
 <20170710185452.GA22803@waldemar-brodkorb.de>
 <20170710234901.221eb3a2@windsurf.lan>
 <87d197tbct.fsf@dell.be.48ers.dk>
Message-ID: <20170711205924.GB2991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-07-11 14:19 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  > OK, so perhaps it is better to stop the autobuilder instance from this
>  > machine, and other, more stable machines.
> I guess so :/
> 
> I've stopped the instance on gcc68.

I was also investigating my build issues about dvb-apps:
    http://autobuild.buildroot.org/?reason=dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35

And I just noticed that the recent failures were all on gcc68.

But I think that's propbably because of an incorrect/partial perl
installation on the host. Which hint that we may need to have our own
shot perl, or add extra dependency checking somehow... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
