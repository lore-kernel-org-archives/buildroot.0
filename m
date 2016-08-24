From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Aug 2016 02:17:25 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <7ada4fd0-8ca3-c59f-bbfd-1ece1f636d73@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

On 23-08-16 14:47, Thomas Petazzoni wrote:
> +N:	Arnout Vandecappelle <arnout@mind.be>
> +F:	package/freescale-imx/firmware-imx/
> +F:	package/freescale-imx/imx-lib/
> +F:	package/gstreamer/gst-fsl-plugins/
> +F:	package/moarvm/

 This one was an accident: I took over the patch from Francois and slightly
amended it, but then I committed with --reset-author (I have an alias for git
commit --amend --reset-author -C HEAD). I actually have no idea what moarvm does :-)

> +F:	package/owfs/
> +F:	package/python-bottle/
> +F:	package/sqlcipher/
> +F:	package/stress/

 All of these were really drive-by patches, I don't use any of them regularly.
And in fact, I think that that will be the case for the majority of the packages
that are listed now.

 I'm afraid that maintaining the DEVELOPERS file (pruning dead e-mail addresses,
removing people that are no longer interested in a particular package) is going
to take more effort (i.e. more commits) than we actually gain by putting the
developers in Cc.

 So for this initial version, I'd suggest keeping just the people that we know
are active. Basically the people who have responded to this patch :-) And then
in the contributing documentation, invite people to also update the DEVELOPERS
file with their entry.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
