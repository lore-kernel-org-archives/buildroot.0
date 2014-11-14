From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 14 Nov 2014 14:28:53 +0000
Subject: [Buildroot] [PATCH v2 3/4] evemu: bump version to 2.1.0
In-Reply-To: <1415917478-24273-3-git-send-email-ps.report@gmx.net>
References: <1415917478-24273-1-git-send-email-ps.report@gmx.net>
 <1415917478-24273-3-git-send-email-ps.report@gmx.net>
Message-ID: <546611A5.4000401@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

I suggest you to do this:

EVEMU_SITE = http://www.freedesktop.org/software/evemu
EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz

That way it will download the evemu-2.1.0.tar.xz tarball and your hash
file will make sense.

Right now it downloads a evemu-2.1.0.tar.gz from
http://cgit.freedesktop.org/evemu/snapshot/evemu-2.1.0.tar.gz and your
has file is useless:

$ make
WARNING: No hash found for
/home/ldap/vriera/work/mips-buildroots/mips64/dl/evemu-2.1.0.tar.gz

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
