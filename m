From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 Jul 2015 17:19:34 +0200
Subject: [Buildroot] [PATCH v8 03/16] busybox: applets as individual
	binaries
In-Reply-To: <1436570882-56442-4-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436570882-56442-4-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <CAHXCMMJqurHPDxu7U3Obrqm2OK22wA3QFzYLtZsUJ5Fit7bwYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 11, 2015 at 1:27 AM, Clayton Shotwell
<clayton.shotwell@rockwellcollins.com> wrote:
> The individual binaries option of busybox allows for the applets
> that would usually be symlinks to be built as individual applications
> that link against a shared library.
>
> This feature is needed for SELinux to allow the applications to run
> under the correct SELinux context.
>
> The patch being added allows the individual applications to be
> installed and will be upstreamed to the busybox developers.
>
> The initial work for this change was done by Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>.
>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
