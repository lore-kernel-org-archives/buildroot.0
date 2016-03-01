From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 1 Mar 2016 14:46:34 -0800
Subject: [Buildroot] GSOC idea
Message-ID: <CAJJ6jxuwU=A6ph4MCnz_hF4kODpf5yFsTeZwzTEgWz06wMjZjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry about stealing the release thread. I'll see if a rename will get
the discussion off of it.

On Tue, Mar 1, 2016 at 2:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Steve,
>
> On Tue, 1 Mar 2016 14:06:24 -0800, Steve Calfee wrote:
>
>> I have a suggestion for GSOC.
>
> Unfortunately, we just learned yesterday that the Buildroot has again
> not be selected by Google to be part of the upcoming Google Summer of
> Code program.
>
>> How about give the intern a raspberry pi
>> (or any other dedicated, embedded system) and try to implement locale
>> and utf8 for a busybox system? That will not help buildroot
>> development, but would really help buildroot users.
>
> I am not sure what is missing to achieve what you suggest. We already
> have locale support, and some of these locales use the UTF-8 charset.
>
> Can you describe more precisely what doesn't work for you?
>
Hi Thomas,

Locale stuff has been on the mailing list a couple of times.

Like http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/133685


It seems infrastructure to install locale and utf8 stuff is missing. I
did enable it in busybox, but the locale files were not copied into
/usr/.... Or I just could not figure out how to do it.

Regards, Steve
