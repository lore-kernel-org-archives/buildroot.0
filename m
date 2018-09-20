From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 12:40:05 -0500
Subject: [Buildroot] [PATCH v3 1/2] at: change upstream site,
 bump version
In-Reply-To: <20180920165913.13488-2-giulio.benetti@micronovasrl.com>
References: <20180918213949.36376-1-giulio.benetti@micronovasrl.com>
 <20180920165913.13488-1-giulio.benetti@micronovasrl.com>
 <20180920165913.13488-2-giulio.benetti@micronovasrl.com>
Message-ID: <CANQCQpYjOEUxq0YNUNGv0czZVGORL7Em0pnDmyZPm+CVdw1stQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio,

On Thu, Sep 20, 2018 at 11:59 AM Giulio Benetti
<giulio.benetti@micronovasrl.com> wrote:
>
> At is now available on a git repository at:
> https://salsa.debian.org/debian/at
> Main changes 3.1.16 -> 3.1.23:
> - add support for SELinux, multiple files
> - improve atd.service, see bug report 892819
> - fix various bugs and warnings
> - finalized script to release software
>
> So:
> - change AT_SITE_METHOD to git pointing to release/3.1.23
> - update tarball sha256 in hash file
> - improved S99at script:
>   if /var/spool is linked to /tmp, .SEQ file will be lost and atd won't
>   work neither for a live session. Create .SEQ file if not found, warning
>   during start that after reboot atjobs could be lost.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
