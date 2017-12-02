From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 15:24:42 +0100
Subject: [Buildroot] [PATCH 1/1] webp: add mandatory host-pkgconf
 dependency
In-Reply-To: <20171202141157.12840-1-fontaine.fabrice@gmail.com>
References: <20171202141157.12840-1-fontaine.fabrice@gmail.com>
Message-ID: <20171202152442.6beda8c1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Dec 2017 15:11:57 +0100, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Could you give a few more details here? From a quick grep in the webp
code, I don't see PKG_CHECK_MODULES() used anywhere, not pkg-config
used. I quite probably missed it, but if it's not obvious, a slightly
more verbose commit log would be nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
