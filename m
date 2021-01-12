From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 12 Jan 2021 10:23:53 -0800
Subject: [Buildroot] Host tar 1.32 build issues
In-Reply-To: <dad432a5-a41c-efed-ef6c-1b41fcee8819@mind.be>
References: <CAGt4E5srq1hg4T1YoKX9UUCTJ96DdnNL1XFrYvsgpWjM_KM1EA@mail.gmail.com>
 <95c3b23f-6805-e526-8bc2-a0d48a66895c@mind.be> <20210112091905.GA382149@scaer>
 <dad432a5-a41c-efed-ef6c-1b41fcee8819@mind.be>
Message-ID: <CAGt4E5uAjxt=oPGqzqN7OEGbGbv68DqKq+xE2KntB_wQoeo2Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Jan 2021 at 02:54, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On 12/01/2021 10:19, Yann E. MORIN wrote:
> > Markus, Arnout, All,
> >
> > Not so sure. 1.33 has been released 2021-01-07, but the cpio archives for
> > it are indeed present, and dated today, 2021-01-12.
> >
> > So, maybe we can just point that out to the tar maintainers, that they
> > forgot the cpio for 1.32.
>
>  And as Yann told me on IRC, the cpio for 1.32 appeared today as well. So the
> problem should be solved.
>
>  The only thing missing now is that the .hash file still refers to 1.29.

The two CPIO archives are on the GNU server now. I asked about it on
the GNU tar mailing list last night (my time), and Sergey was so kind
to upload the two missing CPIO archives.

https://lists.gnu.org/archive/html/bug-tar/2021-01/msg00006.html

So everything is in place now.

Regards,
-Markus
