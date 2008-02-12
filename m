From: Dan Nicolaescu <dann@ics.uci.edu>
Date: Mon, 11 Feb 2008 18:12:44 -0800
Subject: [Buildroot] Libtool relinking problem
In-Reply-To: <46a136670802111753w4b6a7fbar93030a13b101eb28@mail.gmail.com>
	(John Voltz's message of "Mon, 11 Feb 2008 20:53:38 -0500")
References: <46a136670802111753w4b6a7fbar93030a13b101eb28@mail.gmail.com>
Message-ID: <200802120212.m1C2Cj1o013353@sallyv1.ics.uci.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"John Voltz" <john.voltz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

  > I'm wondering if anyone else has noticed problems when installing some
  > libraries to the staging_dir, sometimes libtool will place a  random
  > dependency reference as /usr/lib/xxx.la instead of
  > $(STAGING_DIR)/usr/lib/xxx.la.
  > 
  > This appears to be caused by the libtool re-linking during install.
  > Anybody know what to do to fix this? I tried adding

I noticed this too, and I also noticed that it only happens when
selecting the "Generic Development System" option.  I never had time to
trace down what goes wrong when doing that though... 
Hope this helps.
