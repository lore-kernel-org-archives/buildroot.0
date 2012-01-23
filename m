From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jan 2012 23:39:23 +0100
Subject: [Buildroot] [PATCH 13/14] libelementary: Add new package
In-Reply-To: <CAFbHwiR+R=GpvzroJ6tfyYhLV97DKda-pxSyj8OnmLmRQTtDdA@mail.gmail.com>
References: <CAFbHwiR+R=GpvzroJ6tfyYhLV97DKda-pxSyj8OnmLmRQTtDdA@mail.gmail.com>
Message-ID: <201201232339.24375.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 23 January 2012 17:36:21 Will Newton wrote:
> Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> +config BR2_PACKAGE_LIBELEMENTARY_EXAMPLES
> +       bool "libelementary examples"
> +       help
> +         Build and install the elemenatry examples.

 Are the examples so interesting that they warrant installation on the 
target?  I mean, I would expect the typical user to experiment with EFL
on the host, and just compile the final application for the target.
If building the example requires two patches (which will have to be
ported when upgrading libelementary), I'm not sure if the benefit is
worth the effort.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
