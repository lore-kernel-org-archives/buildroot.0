From: Christian Stewart <christian@paral.in>
Date: Fri, 24 Feb 2017 17:24:27 -0500
Subject: [Buildroot] [PATCH 1/3] runc: bump to version
	9df8b306d01f59d3a8029be411de015b7304dd8f
In-Reply-To: <20170223223417.207e170a@free-electrons.com>
References: <1487778385-98470-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170223223417.207e170a@free-electrons.com>
Message-ID: <CA+h8R2pTCALHiS5gtDUH-SLYFb7pCdZaguM7TEhM0WTW6CFh4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Fabrice,

On Thu, Feb 23, 2017 at 4:34 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
>
> Could you review this set of three patches from Fabrice? I'm especially
> interested in your review on PATCH 3/3. See:
>
>   https://patchwork.ozlabs.org/patch/731181/
>   https://patchwork.ozlabs.org/patch/731182/
>   https://patchwork.ozlabs.org/patch/731183/


It's a shame we have to commit-pin docker-containerd, but it seems
necessary as they haven't cut another release yet.

Patch 3/3 looks fine to me. I can't compile-test at the moment - I will be
able to Monday, but I'm willing to bet you've got that covered already. I
examined the changes to Docker in this release and they have changed the
structure of their vendor tree a bit, making the changes in patch 3
necessary.

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170224/71e2ac97/attachment.html>
