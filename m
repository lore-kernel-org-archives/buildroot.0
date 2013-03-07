From: Lionel Orry <lionel.orry@gmail.com>
Date: Thu, 7 Mar 2013 14:14:17 +0100
Subject: [Buildroot] [PATCH 14/34] qt5base: add GUI support
In-Reply-To: <20130307141159.126aaf1b@skate>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362601396-32250-15-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAKAx1chXW8jSsZcP66YxoSYSzdPvXtk3+eyq3UJCpvR21FDCVg@mail.gmail.com>
 <20130307141159.126aaf1b@skate>
Message-ID: <CAKAx1cjksGgYxpvF21ZLuV25Tz3UQmsBPi6c2NHXrJ_EAGivpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Mar 7, 2013 at 2:11 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Lionel Orry,
>
> On Thu, 7 Mar 2013 14:10:20 +0100, Lionel Orry wrote:
>
>> > +QT5_BASE_CONFIGURE_OPTS += -no-xcb
>>
>> typo here: should be
>>
>> QT5BASE_CONFIGURE_OPTS += -no-xcb
>
> Well spotted, thanks! I'm fixing this.
>
> Thanks a lot for your review,

You're welcome. While I'm at it, I switched to 5.0.1 and noticed the
"-fast" option to configure is not recognised. I suppose the
equivalent options are (extract from ./configure -help):

 *  -process ........... Generate only a top-level Makefile.
    -fully-process ..... Generate Makefiles for the entire Qt tree.
    -dont-process ...... Do not generate any Makefiles.

>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Regards,
Lionel
