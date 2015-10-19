From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2015 18:22:50 +0200
Subject: [Buildroot] [[PATCH v4] 1/1] nwipe: new package
In-Reply-To: <CAMQcK5JMGp6MJXGAtxeeR5-Fb=v31LB3C7iWREd+GeZhy1P3sA@mail.gmail.com>
References: <1445264296-24025-1-git-send-email-chaduffy@cisco.com>
 <CAMQcK5JMGp6MJXGAtxeeR5-Fb=v31LB3C7iWREd+GeZhy1P3sA@mail.gmail.com>
Message-ID: <20151019162250.GA3651@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2015-10-19 11:01 -0500, Ryan Barnett spake thusly:
> On Mon, Oct 19, 2015 at 9:18 AM, Charles Duffy <charles@dyfis.net> wrote:
[--SNIP--]
> > diff --git a/package/nwipe/nwipe.hash b/package/nwipe/nwipe.hash
> > new file mode 100644
> > index 0000000..f66b5c3
> > --- /dev/null
> > +++ b/package/nwipe/nwipe.hash
> > @@ -0,0 +1 @@
> > +sha256 63a3f5fbcaf0c013790345ece2cf04c3d85a15c4505b9d92dc779465aafbd52f  nwipe-8a9a71822148cb9c82d971030dafd8d374fd1f48.tar.gz
> 
> I don't think we can have a hash file for packages that are pulled from github.
> 
> Yann - is this correct understanding of the hash file?

This was correct until the beginning of October. You're out of sync!
Hahaha! ;-)

It seems that Gituhb is now providing stable archives, so we decided to
now require hashes even for archives from Github.

However, this means that can only be locally computed hashes, so must be
explicitly said so:

    # Locally computed (from github helper):
    sha256  XXXXX  foo-x.y.z.tar.gz

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
