From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 12:13:44 +0200
Subject: [Buildroot] [PATCH 0/9] Add gcc version dependency mechanism
In-Reply-To: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150805121344.4e8ec1a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Tue,  4 Aug 2015 20:00:32 +0200, Thomas Petazzoni wrote:

> We are getting more and more packages that use C11 or C++11 support,
> or otherwise have some dependency on features available only since
> certain gcc versions.

Since having such a version dependency mechanism was quite important to
resolve some of the build failures we have, I merged since before -rc1.
I've applied all patches, taking into account the reviews from Yann.

I have also fixed the autobuilder external toolchain configurations to
add the corresponding options:

  http://git.buildroot.net/buildroot-test/commit/?id=18e955cac54a01bab2e1ace375bd9cc7ad53a8c9

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
