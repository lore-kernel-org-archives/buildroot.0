From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 16 Jan 2018 08:18:47 -0600
Subject: [Buildroot] [PATCH] xen: bump to version 4.9.1
In-Reply-To: <20180114224711.25133-1-peter@korsgaard.com>
References: <20180114224711.25133-1-peter@korsgaard.com>
Message-ID: <CANQCQpayJkVAxWQS_42y+o3b-TJ5P5EVFzoz5cOcwmcsLTZJYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sun, Jan 14, 2018 at 4:47 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Drop 0003-tools-libxc-xc_dom_arm-add-missing-variable-initiali.patch as that
> is now upstream:
>
> https://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=88bfbf90e35f1213f9967a97dee0b2039f9998a4
>
> Drop security patches as 4.9.1 includes up to xsa-245.
>

I ran it through test-pkg and that looked good.

I also did a build against the autobuilder failure below.  Looks like
that failure is still present.
http://autobuild.buildroot.net/results/8bcb80dc93d38bb38ca32ad93d52c22d1176d57e/

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
