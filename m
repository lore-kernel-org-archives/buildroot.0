From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Feb 2015 07:14:59 +0100
Subject: [Buildroot] [PATCH v2] Linux kernel: add support for config
 fragment files
In-Reply-To: <20150214232036.GI3886@free.fr>
References: <1423921601-20473-1-git-send-email-bos@je-eigen-domein.nl>
 <20150214165911.GE3886@free.fr>
 <54DFCE8C.9060107@je-eigen-domein.nl>
 <20150214232036.GI3886@free.fr>
Message-ID: <20150215071459.09b593fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Floris,

On Sun, 15 Feb 2015 00:20:36 +0100, Yann E. MORIN wrote:

> There are three options here:
> 
>  1- we just copy the .config back to FOO_KCONFIG_FILE, and leave to the
>     user the duty to further strip it if need be;
> 
>  2- we try to be smart and deal with regenerating a config file that
>     does not contain any of the fragments, and we fail (because that is
>     really complex);
> 
>  3- we just error out in case fragments are being used, because we don't
>     know how to save a (def)config file in this case (see above: it's
>     really compex).
> 
> My opinion would be we go with 3 (my prefernce) or 1, not 2.

My preference would also be option (3).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
