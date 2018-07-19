From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 15:24:49 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: Avoid absolute path to python
 in shebang
In-Reply-To: <20180719125828.xjctfak3qpsawq5z@bifrost>
References: <1531413454-11546-1-git-send-email-david.owens@rockwellcollins.com>
 <20180718171843.5ed5f10c@windsurf>
 <20180719075842.k3gxopajcat7f4dt@bifrost>
 <20180719100456.2146ce8b@windsurf>
 <20180719115033.vchfjfwmewah2wjd@bifrost>
 <20180719141557.6f52723a@windsurf>
 <20180719125828.xjctfak3qpsawq5z@bifrost>
Message-ID: <20180719152449.054a35f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 14:58:28 +0200, anisse at astier.eu wrote:

> > And also, it's not correct because our libglib package does not depend
> > on having python3 available on the host.
> 
> My understanding is that the scripts work with python2 too but that
> upstream is moving to python3 by default, because meson already requires
> host python3, which narrows the number of build-time dependencies.

OK, understood.

> So I don't think there's anything to change here, since host python2 is
> already a mandatory buidroot dependency.

Yes, that is correct. What I wasn't sure is if libglib2 needed any
version of python, or specifically python3.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
