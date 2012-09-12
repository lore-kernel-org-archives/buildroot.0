From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Sep 2012 18:12:06 +0200
Subject: [Buildroot] [git commit] package: add opus audio codec library
In-Reply-To: <20120912073358.E363B99621@busybox.osuosl.org>
References: <20120912073358.E363B99621@busybox.osuosl.org>
Message-ID: <5050B456.6040807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/12 22:50, Peter Korsgaard wrote:
> +OPUS_CONF_OPT = --disable-doc
That should depend on BR2_HAVE_DOCUMENTATION, no?

Regards,
Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
