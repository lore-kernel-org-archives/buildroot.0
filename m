From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 31 Jul 2014 10:00:09 +0200
Subject: [Buildroot] Remaining patch series for 2014.08 ?
In-Reply-To: <20140731092301.67665977@free-electrons.com>
References: <20140731092301.67665977@free-electrons.com>
Message-ID: <CAAXf6LVnp7updkR4Z8zmOsSFuumWL4vJKOHiBq47CZ-6KzPJGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 31, 2014 at 9:23 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> 2014.08-rc1 will be released by Peter around August 4th-5th, which
> gives us a few more days to merge some additional patches. I'm
> interested in hearing opinions/reviews about:
>
>  - The kconfig-package infra from Thomas DS
>    http://lists.busybox.net/pipermail/buildroot/2014-July/103172.html
>
>  - The OPT -> OPTS series from Thomas DS
>    http://lists.busybox.net/pipermail/buildroot/2014-July/103082.html
>

I won't promote my own series, of course :-)

>
>  - The download wrapper series from Yann
>    http://lists.busybox.net/pipermail/buildroot/2014-July/102526.html

I think this is definitely a candidate to apply still. I'm hoping I
can test at least the wget / hg part and give feedback.
In any case I think the risk is low: during the next month the
autobuilders will definitely catch any issue that may still be present
in this series, as we have all types of methods in use.

Best regards,
Thomas
