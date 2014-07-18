From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 18 Jul 2014 15:10:28 +0200
Subject: [Buildroot] [PATCH 2/6] systemd: revert getty service
 installation
In-Reply-To: <20140717210330.64cc9291@free-electrons.com>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1404406659-31109-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20140706202818.GF3684@free.fr>
 <20140717115757.GA20114@rmm-p1267483>
 <20140717210330.64cc9291@free-electrons.com>
Message-ID: <20140718131025.GA28848@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Thu, Jul 17, 2014 at 09:03:30PM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Thu, 17 Jul 2014 13:57:58 +0200, Eric Le Bihan wrote:
>
> > > Would you care verify if this proposed patch is still valid now?
> >
> > This generic fix solves my issue: I will remove this patch.
>
> Thanks. I've therefore marked http://patchwork.ozlabs.org/patch/366936/
> as Rejected.
>
> Could you take care of respining the other patches in your systemd
> series, i.e:
>
>   http://patchwork.ozlabs.org/patch/366938/ (good on the principle, but
>   I think it doesn't apply properly on top of master, and there were
>   minor comments from Arnout)

    A new version, with an updated commit log, is available:
    http://patchwork.ozlabs.org/patch/371527/.

>
>   http://patchwork.ozlabs.org/patch/366939/ (some real concerns on this
>   patch, maybe it should be last in the series, or reworked by a
>   complete revamp of the skeleton strategy)

    I dropped this patch, so I marked it as "rejected" in patchwork.
>
>   http://patchwork.ozlabs.org/patch/366940/ (looks good, with a
>   suggestion from Arnout).

    I resent it (without changes as the suggestion was not working) and marked
    the previous version as "superseeded":
    http://patchwork.ozlabs.org/patch/371528/.

Best regards,
ELB
