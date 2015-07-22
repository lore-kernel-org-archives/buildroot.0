From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 22 Jul 2015 16:44:20 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <55AFB950.10603@zacarias.com.ar>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
 <CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>
 <55AF8CF6.7080709@zacarias.com.ar>
 <20150722144535.103766f3@free-electrons.com>
 <55AF91B5.8050806@zacarias.com.ar>
 <CA+BsyQ77MtQSbwE-XCyi3Q0=079pvd4Rx=OoVBr9X_7zx02NyQ@mail.gmail.com>
 <20150722165405.217f4e4f@free-electrons.com>
 <CA+BsyQ67ic88wTW173o4QWbZS8d=cnSRh_2RDp4Ffs8T2Lsyeg@mail.gmail.com>
 <55AFB950.10603@zacarias.com.ar>
Message-ID: <CA+BsyQ56NZxr-PKNO4CJxt7Thh_FwEUqu-kq+pES8y-p4e6Fcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> It's been a long time since i touched SPARC hardware, and even so i think
> this looks like the right approach.
> Though for other packages we'll still need to handle the libatomic
> situation on a per-arch basis, but it will need to be finer-grained than
> that since different ISA levels affect the availability of atomics as well.
> Regards.
>

A similarly long time since I've touched SPARC hardware. Even longer since
I've seen SPARC on an embedded box. I've seen telecom hardware with a SPARC
CPU but that was some time ago.

Do we use the 'D' word around here (deprecation) ?

regards

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150722/06d78341/attachment.html>
