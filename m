From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Aug 2015 11:28:53 +0200
Subject: [Buildroot] [PATCH 1/1] protobuf/protobuf-c: bump versions
In-Reply-To: <20150814164515.GE4017@free.fr>
References: <1439516481-3375-1-git-send-email-nimaim@gmail.com>
 <20150814121935.GA4017@free.fr>
 <CALoSW66YprLV_WKuWUrPgzT9hL2JzBh69ggg2dNE3rxEkXohXg@mail.gmail.com>
 <20150814123735.GB4017@free.fr>
 <CALoSW67wa+ZY8PswjOFauGeT3-DT0eqd8VnxfS70OUECR_DQeA@mail.gmail.com>
 <20150814154215.GD4017@free.fr>
 <CALoSW65Z_+s+N0E7WSDbqNqzFTfaoDWaCPfA9uPyUh6Q-LyfRw@mail.gmail.com>
 <20150814164515.GE4017@free.fr>
Message-ID: <20150815092853.GA3626@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nimai, All,

On 2015-08-14 18:45 +0200, Yann E. MORIN spake thusly:
> On 2015-08-14 11:54 -0400, Nimai Mahajan spake thusly:
> > On Aug 14, 2015 11:42 AM, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > So I think it is musch easier to just mark the package as not being
> > > availble for static-only builds...
> > Agreed ... will do. I appreciate the help.
> 
> In this case, prepare two patches:
>   - one to "fix" the static issue, that can be applied to master,
[--SNIP--]
> (In fact I already have the fix locally, but did not have time to submit
> it so far, so be my guest and submit it if you want! ;-) )

So, I've now sent this patch:
    https://patchwork.ozlabs.org/patch/507628/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
