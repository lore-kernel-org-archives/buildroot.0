From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:37:32 +0100
Subject: [Buildroot] [PATCH v3 1/3] ejabberd: convert patches to git
 format
In-Reply-To: <1456078306-26054-1-git-send-email-fhunleth@troodon-software.com>
References: <1456078306-26054-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160221213732.5b7dcb19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank,

On Sun, 21 Feb 2016 13:11:44 -0500, Frank Hunleth wrote:

> +Subject: [PATCH 1/8] remove make targets for deps

Please use "git format-patch -N" to not have patch numbering inside the
patches themselves. This way, the numbering doesn't need to be
completely changed when you add a 9th patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
