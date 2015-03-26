From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Mar 2015 17:57:43 +0100
Subject: [Buildroot] Naming convention for patches
Message-ID: <CAJtjsKaG8QfL5ZHcZ7osJ0+T=eJTFgHxhCfqe=QWBDHa0z9q0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

In 9.8. Adding project-specific patches:
"Otherwise, patch files matching <packagename>-*.patch are applied in
alphabetical order."

This naming convention has been changed in buildroot, so we can use
the name provided by git format-patch (i.e., without prefixing it by
the package name).
Is this pattern still required for patches inside
BR2_GLOBAL_PATCH_DIR, or is it simply a mistake from the
documentation?

Thanks.
-- 
Johan
