From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Sep 2017 11:54:45 +0200
Subject: [Buildroot] [PATCH] python-numpy: Fix compilation if HAVE_CEXPx
	is defined
In-Reply-To: <20170920171854.48122-1-abrodkin@synopsys.com>
References: <20170920171854.48122-1-abrodkin@synopsys.com>
Message-ID: <612070c1-de3c-e618-a82b-5919daad08d1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-17 19:18, Alexey Brodkin wrote:
> With update of Numpy to the latest version we've got one change which
> breaks Numpy compilcation in some cases.
> 
> This change back-ports upstrema fix from:
> https://github.com/numpy/numpy/pull/9721

 I noticed that there are build failures in the upstream pull request:
https://travis-ci.org/numpy/numpy/builds/277862723

Is that going to be a problem for us?

 Also, charris commented something, I guess that that's not integrated yet?

 Regards,
 Arnout

> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
