From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 May 2014 21:36:40 +0200
Subject: [Buildroot] Buildroot manual: author list
In-Reply-To: <CAAXf6LXSqbJAjOi-YvEdPvcC=-XZE+6Z1Y-d2BRWEhMXu6ufFw@mail.gmail.com>
References: <CAAXf6LXSqbJAjOi-YvEdPvcC=-XZE+6Z1Y-d2BRWEhMXu6ufFw@mail.gmail.com>
Message-ID: <20140527193640.GE3503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-27 21:22 +0200, Thomas De Schampheleire spake thusly:
> Currently, the Buildroot manual contains the following in the introduction:
> 
> "Buildroot usage and documentation by Thomas Petazzoni. Contributions
> from Karsten Kruse, Ned Ludd, Martin Herren and others."
[--SNIP--]
> My feeling is that the current listing of authors is not correct
> towards all these other people. There are at least three alternatives
> to do something about this:
> 
> a. replace the author reference in buildroot by a reference to 'the
> Buildroot developers' and let interested people look up the real list
> in git.
> 
> b. expand the list with some of the major contributors to the manual,
> based on the shortlogs above
> 
> c. add an appendix with a generated list (shortlog) of authors, which
> is then complete and up-to-date.
> 
> 
> I'm leaning more to a. or b. than to c.
> The advantage of a. over b. is that there is no discussion about whose
> name should be in the list (where to draw the line), while b. has the
> advantage of giving more explicit credit.

As I suggested on IRC: what about a.+c.? Just change the introduction to:

    Buildroot manual by the Buildroot developers, see xref:credits[].

and add the appendix 'credits' at the end of the manual?

Otherwise, I'd go for just a.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
