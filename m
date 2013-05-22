From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 May 2013 19:30:35 +0200
Subject: [Buildroot] [PATCH v7 01/10] libglib2: Bump libglib2 to 2.36.1
In-Reply-To: <CAEBucnA3xso9se45tc7EYb1zsPYTQnLk7WHjiKrowJFm7uqkkw@mail.gmail.com>
References: <1369177864-6236-1-git-send-email-spenser@gillilanding.com>
 <1369177864-6236-2-git-send-email-spenser@gillilanding.com>
 <20130522085552.7079aae2@skate>
 <CAEBucnA3xso9se45tc7EYb1zsPYTQnLk7WHjiKrowJFm7uqkkw@mail.gmail.com>
Message-ID: <20130522173035.GA14196@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Spenser, Thomas, All,

On 2013-05-22 10:57 -0500, Spenser Gilliland spake thusly:
> > Is there any reason for bumping libglib2, glibmm and glib-networking in
> > the same patch? I seem to recall in earlier versions of your patch
> > series, you had separate patches for those bumps.
> 
> Case 1 is correct.  I was trying to make the patch bisect-able.  It's
> possible that glibmm and glib-networking would fail to build if the
> version is not consistent.

Thomas, that was me pointing out that bumping glib2, glibmm and
glib-networking separately might be an error, and IIRC Spenser confirmed
that with a test build (discussed on IRC some days ago).

Spenser, to avoid confusion in the future:
  - add the relevant commenter as Cc: in the commit log,
  - and add a little history to your patch commit log, like:

    blabla: do the foo

    Some explanations
    possibly on
    multiple lines

    Signed-off-by: you
    Cc: someone
    Cc: someone else
    ---
    v2 -> v3:
      - fix this and that (someone else)
    v1 -> v2:
      - tweak this and that (someone)

So the reviewer know what has changed when you resend your patch(es).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
