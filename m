From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 10:04:56 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: Avoid absolute path to python
 in shebang
In-Reply-To: <20180719075842.k3gxopajcat7f4dt@bifrost>
References: <1531413454-11546-1-git-send-email-david.owens@rockwellcollins.com>
 <20180718171843.5ed5f10c@windsurf>
 <20180719075842.k3gxopajcat7f4dt@bifrost>
Message-ID: <20180719100456.2146ce8b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Peter in Cc.

On Thu, 19 Jul 2018 09:58:42 +0200, Anisse Astier wrote:

> We just hit this issue with the buildroot-2018.02 branch. Is this is the
> scope of LTS-backportable patches ?
> 
> Otherwise it's very easy to take the patch in an external, but I'm
> guessing it might break other builds somewhere.

I think it definitely makes sense to have it in 2018.02.x, so I guess
Peter will backport it there.

However, it would be nice if someone could try to push this
upstream. The OE patch says it's not appropriate for upstream, but I
disagree, the fact that the shebang can be too long is a real problem,
and if both OE and Buildroot have to fix it, upstream should
(hopefully) be interested in finding a solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
