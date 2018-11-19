From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Nov 2018 18:45:16 +0100
Subject: [Buildroot] [PATCH 1/1] flare-engine: fix debug build
In-Reply-To: <87y39pp0k4.fsf@dell.be.48ers.dk>
References: <20181118213439.10404-1-fontaine.fabrice@gmail.com>
 <87y39pp0k4.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W81qQnTZ_qKApQQYJFCqdJn5Hhf5Bru5uWTDboaLd_1QKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,
Le lun. 19 nov. 2018 ? 16:08, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > If BR2_ENABLE_DEBUG is set, use RelWithDebInfo instead of default Debug
>  > as Debug will add -pg (gprof) which is not always available on toolchain
>
> Is this RelWithDebInfo something specific to flare-engine or is that
> "standard" cmake? If so, perhaps we should use it globally instead of
> Debug?
Unfortunately, this is specific to flare-engine.
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
