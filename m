From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 08:01:43 +0200
Subject: [Buildroot] [PATCH 1/3 v2] core/pkg-generic: rmove intermediate
 file-list files
In-Reply-To: <dedc397770e0af15eac2c7cbac771dbd9260c716.1491427248.git.yann.morin.1998@free.fr>
References: <cover.1491427248.git.yann.morin.1998@free.fr>
 <dedc397770e0af15eac2c7cbac771dbd9260c716.1491427248.git.yann.morin.1998@free.fr>
Message-ID: <20170406080143.2fc92a3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Apr 2017 23:20:57 +0200, Yann E. MORIN wrote:
> To compute the list of files added by a package, we first store the list
> of files before the install, do the install, list the files after the
> install, and finally compare the two lists. The two lists are stored in
> dot-files, hidden in the package's build dir.

Typo in commit title: rmove -> remove

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
