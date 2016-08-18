From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 21:27:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/simh: new package
In-Reply-To: <20160816194236.GC10734@free.fr>
References: <1471297357-11637-1-git-send-email-lothar.felten@gmail.com>
 <20160816035044.GB3368@tarshish>
 <9ba51c53-ddb3-8a59-a3b0-9ba8e3e52f3e@gmail.com>
 <20160816142950.GH3368@tarshish> <20160816194236.GC10734@free.fr>
Message-ID: <20160818212725.65c9b926@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Aug 2016 21:42:36 +0200, Yann E. MORIN wrote:

> > I don't think so. Not sure how our legal info infra handles binary document 
> > formats.  
> 
> FOO_LICENSE_FILES are just copied; we don't do anything with them. So
> it's fine to list a .doc in there.

Not quite true: we generate a big .txt file with the concatenation of
the license text of all packages, see licenses.txt and
host-licenses.txt.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
