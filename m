From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sat, 24 Nov 2018 22:03:08 +0100
Subject: [Buildroot] [PATCH v2] package/libtool: Reduce target package
 to libltdl only
In-Reply-To: <20181124200631.03099f939ead1a2cf50cb714@gmail.com>
References: <20181124165434.31651-1-alexander.sverdlin@gmail.com>
 <20181124184708.GB20308@scaer>
 <20181124200631.03099f939ead1a2cf50cb714@gmail.com>
Message-ID: <20181124220308.9f8200aa4cdf67f106153e97@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Sat, 24 Nov 2018 20:06:31 +0100
Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

> > So, the host presumably also builds libltdl, no? Thus, we should include
> > its licensing information too;
> > 
> >     HOST_LIBTOOL_LICENSE = GPL-2.0+, LGPLv2.1 (libltdl)
> >     HOST_LIBTOOL_LICENSE_FILES = COPYING $(LIBTOOL_SUBDIR)/COPYING.LIB
> > 
> > Not sure about that one, wait a bit for others to confirm before
> > respinning the patch.
> 
> If others agree that there is a licensing issue, this would
> be totally unrelated to libltdl conversion, so I can do it in
> a separate patch.

OK, tried to make a separate patch and understood that it
was wrong idea...

-- 
Alexander Sverdlin.
