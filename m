From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 16:37:12 +0000
Subject: [Buildroot] [PATCH v2 1/1] mtr: bump to version 0.86 and use
 github call
In-Reply-To: <1418177637-28038-1-git-send-email-vsergeev@kumunetworks.com>
References: <1418177455-27127-1-git-send-email-vsergeev@kumunetworks.com>
 <1418177637-28038-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <548876B8.6060104@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivan Sergeev,

just a few things:

On 12/10/2014 02:13 AM, Ivan Sergeev wrote:
>  MTR_CONF_OPTS = --without-gtk --without-glib

The '--without-glib' option doesn't exist in the configure script. You
can remove it.

Also, while you are doing the version bump, why not adding a hash file
as well:

http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-hash

Could you please mark the previous versions of this patch as
'superseded' in patchwork?

And finally, could you please state what changes you make between versions?

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
