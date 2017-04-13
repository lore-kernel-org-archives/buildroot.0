From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 09:20:11 +0200
Subject: [Buildroot] [PATCH v2 0/9] A checkpackage script that verifies
 a package coding style
In-Reply-To: <58eeea7d15ad_5ae111447a8319e8@ultri3.mail>
References: <20170412094909.66ea1ada@free-electrons.com>
 <58eeea7d15ad_5ae111447a8319e8@ultri3.mail>
Message-ID: <20170413092011.7a22ace2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Apr 2017 00:03:25 -0300, Ricardo Martincoski wrote:

> > Looks good to me. I'm wondering what is best between checkpackage and
> > check-packagelib for the folder, but I don't have a strong opinion here.  
> 
> Maybe checkpackagelib?

Looks good to me.

> Indeed a minor detail.
> +1 on this, either the PEP 8 recommendation [2] or the pep8 tool [3].
> 
> My *personal* reasoning for using both is:
> "Some people that wrote much more Python code than me already thought and
> discussed about this to came up with this recommendation"
> "I am lazy so I use the tool so I don't need to read the recommendation too
> often"
> 
> 
> In the long run, it would be good to have opinions from others.
> How do you prefer handling this?
> A) you guys discuss on IRC;
> B) new thread on the mailing list;
> C) add topic to next dev meeting;

A new thread on the mailing list would be fine.

I think the most active Python-ist folks are Samuel Martin, Maxime
Hadjinlian and Thomas De Schampheleire. Make sure to include them in
the discussion.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
