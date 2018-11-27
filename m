From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Nov 2018 17:33:11 +0100
Subject: [Buildroot] [PATCH 1/2] dante: add AUTORECONF=YES
In-Reply-To: <CAPi7W824aKm=wYcmBrjZqVCq6FtDiGxroGJoyZS_dROB95Fcew@mail.gmail.com>
References: <20181126182248.24817-1-fontaine.fabrice@gmail.com>
 <20181126194323.GJ28830@scaer>
 <CAPi7W824aKm=wYcmBrjZqVCq6FtDiGxroGJoyZS_dROB95Fcew@mail.gmail.com>
Message-ID: <20181127163311.GN28830@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2018-11-27 08:17 +0100, Fabrice Fontaine spake thusly:
> Le lun. 26 nov. 2018 ? 20:43, Yann E. MORIN < [1]yann.morin.1998@free.fr> a ?crit?:
>   On 2018-11-26 19:22 +0100, Fabrice Fontaine spake thusly:
>   > We're patching compiler.m4
>   Duh? Already submitted:
>   ? ? [2]https://patchwork.ozlabs.org/patch/1002784/
> I know but I wanted to send the second patch of the serie without waiting for your first patch to be applied.

In that case, you could do that in one of three ways:

  - say so in a post-commit comment (after the --- line) of your own
    patch, or

  - send your patch as a reply to the existing one (using 'git send-email
    --in-reply-to=MSG-ID', where MSG_ID is the message ID of the mail
    that the previous patch was sent as), or

  - 'git am' the existing patch, and send the series, marking the whole
    series as 'v2'.

I would favour the last solution, as I've already used it myself.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
