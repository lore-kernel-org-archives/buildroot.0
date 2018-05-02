From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 2 May 2018 08:54:52 +0200
Subject: [Buildroot] python-pip
In-Reply-To: <CAF_dkJC3g+8LOcchfafNMEUUpdBFfpEQJrJVb9RQiR9CKynwxQ@mail.gmail.com>
References: <CAF_dkJC3g+8LOcchfafNMEUUpdBFfpEQJrJVb9RQiR9CKynwxQ@mail.gmail.com>
Message-ID: <CAGm1_kt6bhJVNtEAy-0kV8D0fH=9DPM=yoYphhKt=U2tZgGSzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,

On Tue, May 1, 2018 at 10:22 PM, Patrick Doyle <wpdster@gmail.com> wrote:
> What are the chances of (re-?)adding python-pip to buildroot?
>
> I found http://lists.busybox.net/pipermail/buildroot/2013-July/075194.html
> where Rohan Fletcher attempted to add it in 2013.  But I don't see it
> in the 2018.02 branch.
>
> Did folks ask questions, Rohan not reply, and nothing ever came of that?
>
> Yes... I get it... it's not part of the buildroot philosophy to
> include package management, but I have a use case that makes sense for
> my application.
>
> I can resurrect Rohan's patch, or I can stop now, if somebody else has
> a better suggestion for upgrading Python packages on a deployed
> system.  (I understand that wheels are the new eggs for Python.
> Perhaps I should look more carefully at wheels).
>
> I'll go look at/for that now.

I think, the biggest problem in updating the Python packages on the
device are the dependencies. Especially external dependencies like C
libraries etc. like python-smbus-cffi, python-cryptography etc. How
are you going to handle this in a generic architecture independent
way?

Yegor
