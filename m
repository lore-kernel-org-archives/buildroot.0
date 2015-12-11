From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Dec 2015 23:27:07 +0100
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG not working fine
In-Reply-To: <CAKpDV8u01myqCx7ROq9C_7B9Wgomb8Assh_SmUeyCRAc3UkAXQ@mail.gmail.com>
References: <CAKpDV8u01myqCx7ROq9C_7B9Wgomb8Assh_SmUeyCRAc3UkAXQ@mail.gmail.com>
Message-ID: <566B4DBB.6010105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-12-15 12:07, Dinesh Guleria wrote:
> Hi,
>
> I am following steps 4 & 5 in this link
> :--https://buildroot.org/downloads/manual/manual.html#_quick_guide_to_storing_your_project_specific_customizations
>
> I am running following command :--- make busybox-update-config
> BR2_PACKAGE_BUSYBOX_CONFIG=/home/dinesh/busybox/busybox.config

 Please check yout spelling. The screenshot you posted has
BR2_PACKAGE_BUSYBOX_CONFIG_FILE=... .

 You may notice that computers are not so forgiving when it comes to spelling
mistakes.

 Regards,
 Arnout

>
> But busybox .config file doesn't go to right path set
> "/home/dinesh/busybox/busybox.config".
>
> Please suggets why is it going to location "package/busybox/busybox.config" ?
>
> See the attached image.
>
> Regards,
>
> Dinesh
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
