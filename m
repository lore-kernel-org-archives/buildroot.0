From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Nov 2014 19:56:40 +0100
Subject: [Buildroot] [PATCH next v2] python-certifi: add new package
In-Reply-To: <20141122190852.748af912@free-electrons.com>
References: <1416649560-3561-1-git-send-email-yegorslists@googlemail.com>
 <20141122170934.GD4295@free.fr>
 <20141122190852.748af912@free-electrons.com>
Message-ID: <20141122185640.GE4295@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-22 19:08 +0100, Thomas Petazzoni spake thusly:
> On Sat, 22 Nov 2014 18:09:34 +0100, Yann E. MORIN wrote:
> 
> > Here are the hashes I computed locally, which you can add as-is to the
> > hash file:
> > 
> > sha1   f53dc8f57aaf6d69c183ebadcec52ece0a55cc3f                         certifi-14.05.14.tar.gz
> > sha256 1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69 certifi-14.05.14.tar.gz
> 
> Why do we suggest to have two hashes? Isn't sha265 sufficient?

As Gustavo said, that's because sha1 and sha256 are two different hash
mechanisms, and it's better to have both.

So I was following his advice, even though I don't mind adding just the
sha256.

> Also, is it necessary to align the different columns? Should it be done
> with tabs or spaces? I've seen different solutions being used.

I don't mind not aligning the fields, though I find it more convenient
to read if they are.

If they get aligned, I think we should use spaces; tabs do not help
because people may have different tabwidths.

Also, aligning with spaces is what we are doing for _PREMISSIONS and
_USERS, so I think that's OK to align.

Also, the manual states:

    Note: the number of spaces does not matter, so one can use spaces to
    properly align the different fields.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
