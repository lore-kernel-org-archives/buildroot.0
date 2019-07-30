From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 30 Jul 2019 22:00:05 +0200
Subject: [Buildroot] [RFC PATCH v2 1/2] makedevs: only warn on xattr
 when not enabled
In-Reply-To: <20190730174651.GG3194@scaer>
References: <20190729230644.2423-1-petr.vorel@gmail.com>
 <20190730174651.GG3194@scaer>
Message-ID: <20190730200004.GA12481@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

...
> It would be nice if the message was displayed only the first time an
> xattr line is encountered, something like:

>     if (!xattr_warned) {
>         bb_error_msg(...);
>         xattr_warned = 1;
>     }
OK, I'll send another version. I'll probably don't print the line content
as it's why to print only 1st of N discharged lines? Or (maybe better) I'll
count them and print warning with count of discharged lines at the end.
It will be also more visible when it's at the end.

Kind regards,
Petr
