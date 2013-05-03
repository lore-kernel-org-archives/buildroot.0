From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 03 May 2013 12:50:57 +0200
Subject: [Buildroot] [PATCH v2 1/3] barebox: add custom version option
In-Reply-To: <CAHkwnC9xHJAHNauNewEGRof4u6YUsLyCsjm5PQgPhCKPwM53rg@mail.gmail.com>
 (Fabio Porcedda's message of "Fri, 3 May 2013 08:49:04 +0200")
References: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
 <1366184503-16875-2-git-send-email-fabio.porcedda@gmail.com>
 <20130501231009.787484f5@skate>
 <CAHkwnC9xHJAHNauNewEGRof4u6YUsLyCsjm5PQgPhCKPwM53rg@mail.gmail.com>
Message-ID: <87vc70xrou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

Hi,

 Fabio> I think it's easier to have a option name that doesn't change.
 Fabio> If there isn't a specific reason to have a option name that
 Fabio> changes then I will send a patch to change the linux kernel
 Fabio> option name.

 Fabio> BR2_LINUX_KERNEL_3_9 -> BR2_LINUX_KERNEL_LATEST_VERSION

Agreed. With the _3_9 option people often don't realize that it will
only exist for a few months, and that they should use the CUSTOM_VERSION
stuff to really fix the version.

-- 
Bye, Peter Korsgaard
