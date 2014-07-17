From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 22:54:06 +0200
Subject: [Buildroot] [PATCH 5/7 v3] package/kexec-lite: Add a package
 for the kexec-lite tools
In-Reply-To: <1402982507.185598.547200888365.5.gpush@pablo>
References: <1402982507.183937.570365596242.0.gpush@pablo>
 <1402982507.185598.547200888365.5.gpush@pablo>
Message-ID: <20140717225406.71d5ac4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

On Tue, 17 Jun 2014 13:21:47 +0800, Jeremy Kerr wrote:
> Kexec-lite is a tiny impementation of kexec for devicetree-based
> platforms.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Thanks, applied, with a bunch of minor changes. From the commit log:

    [Thomas:
    - Add !BR2_PREFER_STATIC_LIB dependency, inherited from the dtc
      package
    - Fix license to be GPLv2+, and not just GPL.
    - Use $(TARGET_CONFIGURE_OPTS) instead of manually passing CC, LD,
      CFLAGS.
    - Use a full path as the target of $(INSTALL)]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
