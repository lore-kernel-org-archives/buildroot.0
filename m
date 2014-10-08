From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 11:20:01 +0200
Subject: [Buildroot] [PATCH] ser2net: Add a hash file
In-Reply-To: <5434FC83.3070303@imgtec.com>
References: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
 <1412692250-13513-2-git-send-email-Vincent.Riera@imgtec.com>
 <20141007192331.0908bbcd@free-electrons.com>
 <5434FC83.3070303@imgtec.com>
Message-ID: <20141008112001.2e0b8b9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 8 Oct 2014 09:57:39 +0100, Vicente Olivert Riera wrote:

> > Why having all those hashes?
> 
> Why not? Those are all the hashes supported in Buildroot. The more we 
> have the better.

I disagree: more hashes means more work to do when bumping the package.
Either one strong hash, or two weaker hashes should be sufficient IMO.

Something to be discussed at the meeting maybe?

> > And the comment indicating how they have
> > been found is missing (locally computed? found on the upstream web
> > site).
> 
> I haven't added any comment because those hashes were locally computed. 
> Do I need to add a comment explain that?

Yes, I believe so.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
