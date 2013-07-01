From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 01 Jul 2013 12:03:55 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	yem-misc-updates
In-Reply-To: <87bo6mvcog.fsf@dell.be.48ers.dk>
References: <cover.1372545265.git.yann.morin.1998@free.fr>
 <87bo6mvcog.fsf@dell.be.48ers.dk>
Message-ID: <51D1540B.7000006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/13 11:42, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>   Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>   Yann> Hello All!
>
>   Yann> This two-patch series adds some cosmetics to the legacy menu.
>
>   Yann> The first patch displays the removal date in the menuconfig, to show
>   Yann> the user how old the legacy options he's using are.
>
>   Yann> The second patch adds to the top-level comment, that legacy options
>   Yann> will be removed at some point in the future, and that non-updated
>   Yann> .config files may fail to build, or run, in unpredictable ways.
>
>   Yann> If we do not intend to remove legacy options, let's just drop patch #2,
>   Yann> of course.
>
> I think we do, question is how soon? 6 months, 1 year?
>
> They are not very expensive, so I suggest we keep them for 1 year.

  I would keep them much longer, at least three years. Most distros have 
a 3 year or more 'stable' branch, so anything inexpensive that we can do 
to approximate that is good I think.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
