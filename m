From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:19:32 +0100
Subject: [Buildroot] [PATCH] xorriso: new package
In-Reply-To: <54B7010B.7090103@ou.edu>
References: <54B17F87.4020002@ou.edu>
 <20150114224128.33fa0f17@free-electrons.com>
 <54B7010B.7090103@ou.edu>
Message-ID: <20150115091932.507e8bd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

Please keep the Buildroot list in Cc, thanks!

On Wed, 14 Jan 2015 17:51:39 -0600, Steve Kenton wrote:

> > [Thomas:
> >   - Rewrap Config.in help text
> >   - Add optional dependencies on libcdio, readline, acl, attr, zlib,
> >     bzip2.
> >   - Handle thread support.
> How do you identify that these are needed so I can try to catch them in 
> the future?

I look at the configure.ac script, and at ./configure --help.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
