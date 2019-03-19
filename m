From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Mar 2019 18:57:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/skeleton-init-common: Create
 /lib/modules directory
In-Reply-To: <CADYdroPQYoDW=T7ZOdDNucb4O3wu4poD-ZVuLY1PApB4i_dMrg@mail.gmail.com>
References: <20190318163010.8056-1-norbert.lange@andritz.com>
 <20190318174436.GI14237@scaer>
 <CADYdroMoAzR6=nniTiBZvvs2fkwJJ7hGM-rd2OixxA6FpjRj7A@mail.gmail.com>
 <20190318190315.GJ14237@scaer>
 <CADYdroPQYoDW=T7ZOdDNucb4O3wu4poD-ZVuLY1PApB4i_dMrg@mail.gmail.com>
Message-ID: <dfeb8c8b-e3bc-f96c-4052-c6b55cf85653@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/03/2019 21:43, Norbert Lange wrote:
> Should I re-roll the patch next, or can we continue this discussion
> until you decide on whether you will include the change.

 For me as well, the direction should be to remove things from the skeleton
rather than adding to it. So if you would get rid of /media etc. I'd maybe be in
favour of it, but I'm certainly not going to defend adding yet another directory.

 I'll add Peter in Cc to draw a line in the sand.

 Regards,
 Arnout
