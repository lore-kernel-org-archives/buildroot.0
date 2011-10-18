From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2011 11:23:03 +0200
Subject: [Buildroot] Request for comments on packages for TI's OMAP3 and
	DM365 processors
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <201110181123.03836.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 17 September 2010 19:59:45, Pierre-Luc Simard wrote:
> Hello All,
> 
> I'd like some comment on the packages I've made to support TI's gstreamer 
> plugin for the OMAP3 and DM365 processors. All packages compile using 
> crosstool-ng and glibc, I have not yet tested them with BR's own internal 
> toolchain and the uclibc at the moment. If anybody wants to test these package
> I'll provide as much assistance as I can. I've publish my working branch at 
> http://github.com/Admetric/buildroot

 Reviving a year-old thread...

 It seems these patches were never commented upon and also weren't
accepted.  I'm going to pick them up again.

 Although these patches still apply cleanly against the current master, there is probably some duplication with the TI things that were merged earlier this year.  I will probably not find them all myself, so I hope there is someone on the list who can keep an eagle eye on such duplicates.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
