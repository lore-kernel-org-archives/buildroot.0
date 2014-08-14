From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Aug 2014 17:46:33 +0200
Subject: [Buildroot] [PATCH v3] fio: add missing libaio dependency
In-Reply-To: <1408025587-866-1-git-send-email-Matthew.Weber@rockwellcollins.com>
References: <1408025587-866-1-git-send-email-Matthew.Weber@rockwellcollins.com>
Message-ID: <20140814174633.6f8d299a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Thu, 14 Aug 2014 09:13:07 -0500, Matt Weber wrote:
> The fio package dlopen()s the libaio library at runtime
> when the ioengine function is selected as libaio.
> 
> ---
> Changes v2 -> v3
>  - Moved description above --- (suggested by Ryan)
> 
> Changes v1 -> v2
>  - Renamed patch to not mention bugfix or description
>  - Removed build dependency as we only need a config
>    dependency for libaio.  Suggested by Thomas P.
>  - Added dependencies to Config.in for targets that
>    libaio supports building for.  Suggested by Thomas P.
>  - Updated comment before select of libaio in Config.in
>    Suggested by Thomas P.
> 
> Signed-off-by Matt Weber <Matthew.Weber@rockwellcollins.com>

You're almost there: the Signed-off-by line should be before the "---"
sign.

 :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
