From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 12 Mar 2015 10:08:10 +0100
Subject: [Buildroot] Changing permission recursively
Message-ID: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Deal All,

I'm in the process of building a rootfs for a custom application and
wondering the best way to change permissions recursively for a
directory.

What I'm trying to achieve is to add some files via an overlay, but
files should have a specific owner/permission which should be read
from the buildroot's users table.

I cannot find something like that in the documentation. Instead, the
documentation specifies how to add single files and change
owner/permission accordingly.

If I understand correctly, I should create a new user (if necessary)
with a specific UDI/GID and than use a POST_INSTALL_TARGET to change
permission using that UID/GID.
Alternatively, I can use FOO_PERMISSIONS with a per file granularity.

Is this correct?

Thanks!

Sincerely, Angelo

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
