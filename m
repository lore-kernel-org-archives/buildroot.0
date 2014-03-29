From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 09:33:17 +0100
Subject: [Buildroot] [PATCH 0/9] Documentation cleanup
In-Reply-To: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140329093317.29e80f16@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Fri, 28 Mar 2014 22:24:41 +0100, Jerzy Grzegorek wrote:

> Here is a series that fixes a few typoes and makes small improvements
> in documentation.

I've applied patches 1 to 6, 8 and 9. For patch 2, I made the change we
discussed.

I haven't applied patch 7, because I don't agree with:

+series is introduced by a cover letter, an overall patch version may be
+added to the cover letter in addition/instead to the individual commits.

The version in the title of the cover letter does *not* replace the
version in the title of the patches. Both should be present, so the
"/instead" is not correct. Also, the "may be added" does not seem
right, because a version is always added to the cover letter title by
"git format-patch --subject-prefix".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
