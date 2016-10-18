From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Oct 2016 00:04:02 +0200
Subject: [Buildroot] [PATCH 00/93] TLP/PPS: package cleanup part 2
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <487b6d27-cde3-da79-b88b-af45b3b11d6c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 18:05, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> This patchset takes over from the first round of cleanup.
> 
> It takes into account feedback on the patches that weren't applied for
> the previous set and addressed them, like setting the proper host env
> for host packages and other steps like configure and install for target
> packages.

 I reviewed the series, posted comments on some, and the ones that can go in
have been added to a bundle:

http://patchwork.ozlabs.org/bundle/arnout/gustavoz_target_make_env_2/

 However, please first consider the question I asked in the cryptopp patch:

HOST_CONFIGURE_OPTS already contains HOST_MAKE_ENV, so if
HOST_CONFIGURE_OPTS is passed as the argument to MAKE, does it still make sense
to pass it in the environment as well?

 I haven't marked the remaining ones as Changes Requested yet, that's a lot
easier to do once the bundle has been merged. Oh, Thomas, there's really no need
to manually add my Reviewed-by everywhere...


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
