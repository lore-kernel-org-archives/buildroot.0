From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:08:00 +0200
Subject: [Buildroot] [PATCH] python-numpy: Bump to the most recent
	release 1.13.1
In-Reply-To: <20170915104606.25218-1-abrodkin@synopsys.com>
References: <20170915104606.25218-1-abrodkin@synopsys.com>
Message-ID: <7a478b5d-e6b9-9652-34fa-c7e52c805cc4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-17 12:46, Alexey Brodkin wrote:
> Note previously used location for releases on SourceForge is no longer
> supported (latest tarball v1.11.2 available there is dated 2016-10-04)
> so as other distros
> (see, Fedora http://pkgs.fedoraproject.org/cgit/rpms/numpy.git/tree/numpy.spec?id=7013948f8ba073c69a91a545f0a0898cb62652fa#n22)
> we get release tarball directly from GitHub.
> 
> Also note 0001-no-fenv-on-uclibc.patch was rebased on v1.13.1 and
> 0002-Don-t-blindly-enable-frexpl-and-ldexpl-for-uClibc.patch was
> removed completely as corresponding code got nuked with
> https://github.com/numpy/numpy/pull/4852. I'm not really sure
> if something similar to Arnout's patch is still required so it would be good
> if somebody more knowledgeable checks that.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>

 Applied to master, thanks.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
