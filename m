From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 14:08:23 +0200
Subject: [Buildroot] [PATCH] parted: fix minor()/major() build failure
 due to glibc 2.28
In-Reply-To: <CAGm1_ktVLoCsxUou+ax6qEc0y8mbOj7FBhid4_vjz9AtHaueqA@mail.gmail.com>
References: <20180909172917.55169-1-giulio.benetti@micronovasrl.com>
 <20180910092510.66b51de5@windsurf.home>
 <13c74cee-bfbb-15af-9b9a-cd7864a5026b@micronovasrl.com>
 <CAGm1_ktVLoCsxUou+ax6qEc0y8mbOj7FBhid4_vjz9AtHaueqA@mail.gmail.com>
Message-ID: <20180910140823.2794d1da@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Sep 2018 13:46:07 +0200, Yegor Yefremov wrote:

> > I still can't find upstream commits in general, I think I don't know
> > enough some tool you use or I don't know the best way to find them.
> > Can you point me some hint for this?
> > Maybe using git in certain way, or checking open PR on various git in a
> > certain way in repositories etc.  
> 
> Install "tig" and invoke:
> 
> tig blame libparted/arch/linux.c

What I typically do is just:

	git log -p <file>

and then use the search to find if there is a commit that looks
relevant.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
