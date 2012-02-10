From: J.C. Woltz <jwoltz@gmail.com>
Date: Fri, 10 Feb 2012 09:21:24 -0500
Subject: [Buildroot] [PATCH] new program: usb_modeswitch_data
 Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
In-Reply-To: <CAAXf6LUeHr4tVnpKHCeHvfTJnO2jdJT=2_O40TLnY_s533S7Jg@mail.gmail.com>
References: <1328831497-18455-1-git-send-email-jwoltz@gmail.com>
 <CAAXf6LUeHr4tVnpKHCeHvfTJnO2jdJT=2_O40TLnY_s533S7Jg@mail.gmail.com>
Message-ID: <CAC78GpdRuVrqsF5n0Xn5MTBJ7vSPDua1rAAwur5tpdxyfwfrFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 10, 2012 at 2:37 AM, Thomas De Schampheleire <
patrickdepinguin+buildroot@gmail.com> wrote:

> Hi,
>
> On Fri, Feb 10, 2012 at 12:51 AM, J.C. Woltz <jwoltz@gmail.com> wrote:
> > From: "J.C. Woltz" <jwoltz@gmail.com>
>
> You don't need the From: line.
> Instead, the Signed-off-by: should appear here, and not in the Subject
> line.
>

I'm sorry, I thought I used the -s switch. I'll look into not getting the
from line.


>
> I think a 'depends on' clause is more appropriate than 'select' here.
>
> As a general rule, the help text should contain the URL to the project.
>

I'll fix the URL. I thought a select was appropriate since
usb_modeswitch_data is not vital for usb_modeswitch, but
usb_modeswitch_data is nice when using udev.


> I know that it's not yet the case for many patches in the buildroot
> tree, but patches should also have a short description at the top, and
> a Signed-off-by: clause.
>
>
I can add a description. I thought I used -s, but I will make sure I do. Is
there any other changes I should make. I am not a programmer or developer,
but trying to help where I can.


>
> Best regards,
> Thomas
>

Thank you,
J.C. Woltz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120210/4a9d037a/attachment-0001.html>
