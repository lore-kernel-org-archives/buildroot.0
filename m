From: Mitch Davis <mjd+buildroot@afork.com>
Date: Mon, 5 Jul 2010 20:01:24 +1000
Subject: [Buildroot] QSound
In-Reply-To: <20100705114438.42654139@surf>
References: <AANLkTimNs2jP4EzQhA7XwVVXvXaRTI-FhTbKvnxgqSuj@mail.gmail.com> 
	<20100705114438.42654139@surf>
Message-ID: <AANLkTikEBUlfD4bFyAW2EV9yOdvZ0DvHGjnn7um6JAd3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 5, 2010 at 7:44 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sun, 4 Jul 2010 14:29:40 +0300
> Mahmoud Mamdouh <mamdouh.al.shamy@gmail.com> wrote:
>
>> can't load library 'libQtMultimedia.so.4
>
> There is a bug in Buildroot 2010.05: Buildroot doesn't copy the
> libQtMultimedia library to the target when BR2_PACKAGE_QT_MULTIMEDIA is
> enabled.

Ahh, that would explain it :-)

> In the mean time, you can apply commit
> 79ec8e88f3a5afacff27e8eb94a5aeda17cf734a to your tree to fix the issue.

Mahmoud, if you're not a git user, you can retrieve the patch here:

  http://git.buildroot.net/buildroot/patch/?id=79ec8e88f3a5afacff27e8eb94a5aeda17cf734a

Mitch.
