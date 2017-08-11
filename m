From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 14:08:33 +0200
Subject: [Buildroot] [PATCH] package/valgrind: hide comment when arch is
 not supported
In-Reply-To: <20170810215111.32360-1-yann.morin.1998@free.fr>
References: <20170810215111.32360-1-yann.morin.1998@free.fr>
Message-ID: <4fce7fb0-4c63-311c-7eb8-e0af0bd2277c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-08-17 23:51, Yann E. MORIN wrote:
> Currently, the comment that "valgrind needs shared libs" is not hidden
> when the architecture dependencies are not met, which can confuse some
> users (as recently seen on IRC).
> 
> Fix that by introducing the traditional _ARCH_SUPPORTS option, and have
> the comment and the symbol depend on that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Brandon Maier <brandon.maier@rockwellcollins.com>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

 Applied to master after moving the _ARCH_SUPPORTS to the top of the file and
adding Pedro's Rev-by and Tested-by, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
