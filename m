From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 22 Jul 2015 16:27:43 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722165405.217f4e4f@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
 <CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>
 <55AF8CF6.7080709@zacarias.com.ar>
 <20150722144535.103766f3@free-electrons.com>
 <55AF91B5.8050806@zacarias.com.ar>
 <CA+BsyQ77MtQSbwE-XCyi3Q0=079pvd4Rx=OoVBr9X_7zx02NyQ@mail.gmail.com>
 <20150722165405.217f4e4f@free-electrons.com>
Message-ID: <CA+BsyQ67ic88wTW173o4QWbZS8d=cnSRh_2RDp4Ffs8T2Lsyeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 July 2015 at 15:54, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Brendan,
>
> My fairly uninformed opinion is that this indeed looks like a good
> approach. Though maybe Gustavo's more informed opinion might contradict
> me on this.
>

Like you I would bow to Gustavo's SPARC knowledge. But I submitted the
patch upstream, let's see what they say. I think they *intend* glib to fall
back with the USE_NATIVE_MUTEX macro when hw support isn't present - here,
we're just fixing their detection of that case.

https://bugzilla.gnome.org/show_bug.cgi?id=752731

regards

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150722/1ec92d52/attachment.html>
