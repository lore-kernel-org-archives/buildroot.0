From: Florian Fainelli <f.fainelli@gmail.com>
Date: Thu, 26 Apr 2018 09:55:12 -0700
Subject: [Buildroot] Including legal-info manifest into rootfs?
Message-ID: <6235a2ee-dc86-a18f-2278-5915bb1027ca@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I find myself in need of including the legal-info manifest into the
rootfs, there does not appear to be a package that would include that,
but that would seem like a natural approach to doing this.

Right now this is done as a step in post-build.sh, but this is less than
ideal because it still makes it environment specific.

Has anybody done that before?

Thank you
-- 
Florian
