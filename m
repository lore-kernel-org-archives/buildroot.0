From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Mon, 14 Oct 2013 20:07:44 +0200
Subject: [Buildroot] [PATCH v5] espeak: new package
In-Reply-To: <20131014195835.4e87ee20@skate>
References: <1381770929-13754-1-git-send-email-arnaud.aujon@gmail.com>
 <20131014194050.6f0db457@skate>
 <CACjG4BJKxk6=y7iAyBxsw3E5HA=x4kxM+GWXCqbn8Z4Tx6XH-A@mail.gmail.com>
 <20131014195835.4e87ee20@skate>
Message-ID: <CACjG4BKaBE9tE1N+i4hPUJ5vzg6sjk6y5-QgorykTOD4aRSmSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/10/14 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear arnaud aujon,
>
> On Mon, 14 Oct 2013 19:49:09 +0200, arnaud aujon wrote:
>
> > I will send a new patch shortly.
> > About the licence, the file Licence.txt say GPLv3 but you're right in the
> > source code we can find GPLv3+, what do you do in this case ?
>
> It's very often the case: the COPYING or License file provides the
> license text for a given version of the GPL license, and the code
> itself precises whether it's only this version, or this version or
> later. And since the FSF recommends using the "or later" wording, many
> projects do this.
>
> In this case, the <pkg>_LICENSE should really be GPLv3+, because that's
> what the source code says.
>
>
Thanks for your explanation.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131014/98e4b369/attachment.html>
