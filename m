From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Mar 2014 18:37:03 +0100
Subject: [Buildroot] [PATCH 11/12] manual: add documentation about
 packages' hashes
In-Reply-To: <CAAXf6LUexBaQVBvqZ5J5k895fqkv5qoX01pVeCuoEOpyO8O8Lg@mail.gmail.com>
References: <cover.1394055621.git.yann.morin.1998@free.fr>
 <9cab6ed51fae5b7d5baa2a514aea4c7c5205fb30.1394055621.git.yann.morin.1998@free.fr>
 <CAAXf6LUexBaQVBvqZ5J5k895fqkv5qoX01pVeCuoEOpyO8O8Lg@mail.gmail.com>
Message-ID: <20140306173703.GD3625@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-06 18:14 +0100, Thomas De Schampheleire spake thusly:
> On Wed, Mar 5, 2014 at 10:47 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> > index e56e59a..4609a7e 100644
> > --- a/docs/manual/adding-packages-directory.txt
> > +++ b/docs/manual/adding-packages-directory.txt
[--SNIP--]
> > +* the name of the file, without any directory component
> > +
> > +Lines starting with a +#+ sign are considered comments, and ignored. Empty
> > +lines are ignored.
> > +
> > +There can be more than one hash for a single file, each of its own line. In
> 
> I think you can say:
> ..., each on its own line
> ..., each on a line of its own
> but not 'each of its own line'

Funny how one reads what one thinks he has written, and not what was
actually written. Of course, I meant 'on', not 'of'.

> > +this case, all hashes must match.
> > +
> > +Ideally, the hashes stored in this file should match the hashes published by
> > +upstream, eg, on their website, in the email announcement... If no such info
> 
> 'eg' should be written with dots (e.g. , see
> http://en.wikipedia.org/wiki/Exempli_gratia#exempli_gratia )
> e-mail (with dash)
> 
> > +is available, then compute them yourself, and state so in a comment line
> > +above the hashes.
> 
> I would write for this last sentence:
> If upstream does not provide hashes, [...]

Furthermore, since there is no hash, it can be plural. I now wrote:

    If upstream does not provide any hash, [...]

All applied. Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
