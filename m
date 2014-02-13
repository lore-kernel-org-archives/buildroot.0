From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 22:07:09 +0100
Subject: [Buildroot] [PATCH v4 0/5] Python 3, simple,
 external package support
In-Reply-To: <1360922412-32559-1-git-send-email-kpa_info@yahoo.fr>
References: <1360922412-32559-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <20140213220709.200e22e2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick Gerber,

On Fri, 15 Feb 2013 11:00:07 +0100, Patrick Gerber wrote:
> This patch series refactor python support in buildroot to enable the 
> use of external package with both; python2 and python3. The packages
> python-bottle and python-serial have been adapted as examples.
> 
> To support others external package more work is needed as they are
> based on python setuptools. It's no more supported by python3 and
> should be replaced by "Distribute". This should be done in another
> patch series.

It's been a very long time (one year), but I have sent a patch series
that bumps Python 2.x and 3.x to their latest version, and adds the
possibility of building Python external modules with Python 3.

If you have some time, I would definitely be interested by receiving
comments, and testing reports. For details, see:

  http://lists.busybox.net/pipermail/buildroot/2014-February/089309.html

The code is available at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=python3-pkg

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
