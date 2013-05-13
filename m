From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 May 2013 17:38:23 +0200
Subject: [Buildroot] [PATCH 1/2] libtool : bump to version 2.4.2
In-Reply-To: <1570358723.2368493.1368458982853.JavaMail.root@openwide.fr>
References: <20130513112730.5ad21c4d@skate>
 <1570358723.2368493.1368458982853.JavaMail.root@openwide.fr>
Message-ID: <20130513173823.7b5b5186@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Mon, 13 May 2013 17:29:42 +0200 (CEST), Jeremy Rosen wrote:
> I needed to bump libtool because pulseaudio needed it.
> 
> I built my system (including pulseaudio) and tested it, but I didn't 
> give it further (enough) thought.
> 
> This prbably means that this patch should not go in master but in 
> next... It's probably way too late to bump libtool.

Version bumps are no longer going to master anyway, not even the
pulseaudio version bump. At this point, master is only about bug fixes,
so it's certainly not the time to bump packages!

> I'll do the allyesconfig test and reply with the results when done...

If you want, I can test the patch here on an allyespackageconfig build.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
