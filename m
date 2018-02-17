From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Sat, 17 Feb 2018 14:29:04 +1100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <20180216154959.4db712f5@windsurf.lan>
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
 <20180108091044.1141f540@windsurf> <20180205224500.1a34e02a@windsurf>
 <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
 <20180213231930.26ab0efb@windsurf.lan>
 <16c3e28e-8da0-75f0-1f9a-c1ed86741fc3@au1.ibm.com>
 <20180214090148.5b21f55e@windsurf.lan> <87lgftau6p.fsf@linkitivity.dja.id.au>
 <20180216154959.4db712f5@windsurf.lan>
Message-ID: <1d3689da-fd58-9690-a502-d37aa9bb0166@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/18 01:49, Thomas Petazzoni wrote:
> Thanks a lot for the follow-up details on this.
> 
> I think it's worth mentioning that it seems to be a relatively "recent"
> regression, probably within the last 6 months or so. In the past, we
> were clearly not seeing such a problem, and all patches were properly
> recorded. The problem is frequent enough that we would have noticed.

We have, anecdotally, noticed some regressions in database performance 
in patchwork 2.0 which might increase the likelihood of hitting race 
conditions. Hmm.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan at au1.ibm.com  IBM Australia Limited
