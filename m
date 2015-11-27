From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Nov 2015 23:37:17 +0100
Subject: [Buildroot] [PATCH 2/2] unzip: new package
In-Reply-To: <5658D7F4.1010506@lucaceresoli.net>
References: <1448645881-32202-1-git-send-email-luca@lucaceresoli.net>
 <1448645881-32202-2-git-send-email-luca@lucaceresoli.net>
 <5658CDAD.20304@mind.be> <5658D7F4.1010506@lucaceresoli.net>
Message-ID: <5658DB1D.5020809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27-11-15 23:23, Luca Ceresoli wrote:
> Dear Arnout,
>
> Arnout Vandecappelle wrote:
> > On 27-11-15 18:38, Luca Ceresoli wrote:
> >> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> >> Cc: Romain Naour <romain.naour@openwide.fr>
> >> Cc: Jan Pedersen <jp@jp-embedded.com>
> >
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> Thanks Arnout. However I have to Nack my own patch... I realized it
> misses an if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS: busybox has unzip, but
> it's less featured than the InfoZip's one.
>
> I'll respin with that fixed.

 Don't forget to add a dependency on busybox as well.

 Regards,
 Arnout

>
> Mmh, weird, busybox has 'unzip', but no 'zip'.
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
