From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 07 Dec 2011 19:55:31 +0100
Subject: [Buildroot] [PATCH 4/4] sqlite: add option to enable additional
 query optimizations (stat3)
In-Reply-To: <CAAXf6LWGTLq_m9WXA4iu_b86cWMAqPa5=prqws2Kd5vgdQkZ=Q@mail.gmail.com>
References: <1323204723-6020-1-git-send-email-s.neumann@raumfeld.com>
 <1323204723-6020-4-git-send-email-s.neumann@raumfeld.com>
 <CAAXf6LWGTLq_m9WXA4iu_b86cWMAqPa5=prqws2Kd5vgdQkZ=Q@mail.gmail.com>
Message-ID: <1323284131.8394.1.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-12-07 at 07:57 +0100, Thomas De Schampheleire wrote:
> On Tue, Dec 6, 2011 at 9:52 PM, Sven Neumann <s.neumann@raumfeld.com> wrote:
> > +config BR2_PACKAGE_SQLITE_STAT3
> > +       bool "Additional query optimizations (stat3)"
> > +       depends on BR2_PACKAGE_SQLITE
> > +       help
> > +         Adds additional logic to the ANALYZE command and to the query
> > +         planner that can help SQLite to chose a better query plan under
> 
> s/chose/choose/

Actually that typo should be fixed upstream in the sqlite documentation
then ;-)

Thanks for the review, I'll resubmit the patch-set with the typo fixed
and your Reviewed-by: added.


Sven
