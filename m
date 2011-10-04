From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Oct 2011 18:15:51 +0200
Subject: [Buildroot] Derive HOST_FOO_DEPENDENCIES automatically
In-Reply-To: <20111004073443.24b1da67@skate>
References: <201110032133.44496.arnout@mind.be>
 <201110032335.06739.arnout@mind.be> <20111004073443.24b1da67@skate>
Message-ID: <201110041815.51324.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tuesday 04 October 2011 07:34:43, Thomas Petazzoni wrote:
> Le Mon, 3 Oct 2011 23:35:05 +0200,
> 
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> >  By the way, there is a disappointingly large number of packages that
> >
> > have a difference between FOO_DEPENDENCIES and HOST_FOO_DEPENDENCIES:
> Not necessarily a problem.

 The "problem" is that the gain of this change (as in number of lines removed) 
is not as large as I had hoped.

 23 files changed, 17 insertions(+), 34 deletions(-)

 Of course, an additional advantage of this change is that adding a host 
variant of a package has a much larger chance of working right away.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
