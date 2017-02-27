From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 13:20:49 +0100
Subject: [Buildroot] [PATCH 1/3] runc: bump to version
 9df8b306d01f59d3a8029be411de015b7304dd8f
In-Reply-To: <CA+h8R2pTCALHiS5gtDUH-SLYFb7pCdZaguM7TEhM0WTW6CFh4Q@mail.gmail.com>
References: <1487778385-98470-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170223223417.207e170a@free-electrons.com>
 <CA+h8R2pTCALHiS5gtDUH-SLYFb7pCdZaguM7TEhM0WTW6CFh4Q@mail.gmail.com>
Message-ID: <20170227132049.52bc154c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Feb 2017 17:24:27 -0500, Christian Stewart wrote:

> It's a shame we have to commit-pin docker-containerd, but it seems
> necessary as they haven't cut another release yet.
> 
> Patch 3/3 looks fine to me. I can't compile-test at the moment - I will be
> able to Monday, but I'm willing to bet you've got that covered already. I
> examined the changes to Docker in this release and they have changed the
> structure of their vendor tree a bit, making the changes in patch 3
> necessary.

Thanks, so I've committed Fabrice patches.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
