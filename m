From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 9 Apr 2021 23:10:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: security bump
 to version 1.22.16
In-Reply-To: <87eefj9sqt.fsf@dell.be.48ers.dk>
References: <20210409164319.3326427-1-fontaine.fabrice@gmail.com>
 <87eefj9sqt.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W818bxm6WDytfQCqRSqTNPdx6mUHAZ++gm_jV1k4hE9jKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Le ven. 9 avr. 2021 ? 21:13, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > ifcfg-rh: handle "802-1x.{,phase2-}ca-path". Otherwise setting this
>  > property silently fails and a profile might accidentally not perform
>  > any authentication (CVE-2020-10754).
>
> ifcfg-rh sounds like something specific to Redhat distributions? I guess
> it isn't used in Buildroot?
Indeed, the "security" part should probably be dropped from this bump.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
