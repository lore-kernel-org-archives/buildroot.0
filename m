From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 12 Jan 2021 15:26:56 -0800
Subject: [Buildroot] Host tar 1.32 build issues
In-Reply-To: <20210112210443.GZ3044608@scaer>
References: <CAGt4E5srq1hg4T1YoKX9UUCTJ96DdnNL1XFrYvsgpWjM_KM1EA@mail.gmail.com>
 <95c3b23f-6805-e526-8bc2-a0d48a66895c@mind.be> <20210112091905.GA382149@scaer>
 <dad432a5-a41c-efed-ef6c-1b41fcee8819@mind.be>
 <CAGt4E5uAjxt=oPGqzqN7OEGbGbv68DqKq+xE2KntB_wQoeo2Ew@mail.gmail.com>
 <20210112210443.GZ3044608@scaer>
Message-ID: <CAGt4E5tquWH5mqSW2vdj7Gx7OcMo+38JOtwTSUDF8odjKi7DDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Jan 2021 at 13:04, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Markus, Arnout, All,
>
> On 2021-01-12 10:23 -0800, Markus Mayer spake thusly:
> > The two CPIO archives are on the GNU server now. I asked about it on
> > the GNU tar mailing list last night (my time), and Sergey was so kind
> > to upload the two missing CPIO archives.
> >
> > https://lists.gnu.org/archive/html/bug-tar/2021-01/msg00006.html
> >
> > So everything is in place now.
>
> There was still the update to the hash file that was missing. I've now
> fixed it.
>
> Thank you for noticing the issue and reporting so promptly! :-)

I have an automated nightly build going that notices such things on my
behalf. :-)

> Now, tar 1.33 is out, care to send an update? ;-]

I did create a patch for this, but just as I was getting ready to
submit it to the list, I noticed that a regression has been found in
tar 1.33. Looks like it may only affect OpenBSD. At least I wasn't
able to reproduce it on Linux.

https://lists.gnu.org/archive/html/bug-tar/2021-01/msg00012.html

Still, I am wondering if we do want to go ahead with 1.33 or if we
should hold off and see whether 1.34 is released in the not too
distant future.

Regards,
-Markus




> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
