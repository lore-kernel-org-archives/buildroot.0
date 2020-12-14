From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Dec 2020 18:24:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/suricata: bump to version 6.0.1
In-Reply-To: <87czzcwi9w.fsf@dell.be.48ers.dk>
References: <20201213170420.992917-1-fontaine.fabrice@gmail.com>
 <20201213170420.992917-2-fontaine.fabrice@gmail.com>
 <87czzcwi9w.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W82ummSiaNqyG5Nfv1MyKmO9d8gcqytF-52gFakZRW=TEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le lun. 14 d?c. 2020 ? 15:53, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > These releases are bug fix releases, fixing numerous important issues.
>  > The 6.0.1 release also improves the experimental HTTP/2 support.
>
>  > https://suricata-ids.org/2020/12/04/suricata-6-0-1-5-0-5-and-4-1-10-released
>
> Is the libhtp bump a dependency for this when backporting?
Yes, libhtp 0.5.36 is mandatory with suricata 6.0.1:
https://github.com/OISF/suricata/commit/f5af8864f7d2e1521a33f1e48e804404a87e8f0e
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
