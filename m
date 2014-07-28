From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 20:54:30 +0200
Subject: [Buildroot] [PATCH 1/2] Postgresql: Enable staging install for
 packages that need it to build
In-Reply-To: <1406548649-4649-1-git-send-email-nroach44@gmail.com>
References: <1406548649-4649-1-git-send-email-nroach44@gmail.com>
Message-ID: <20140728205430.7efde57b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Mon, 28 Jul 2014 19:57:28 +0800, Nathaniel Roach wrote:
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
>  package/postgresql/postgresql.mk | 2 ++
>  1 file changed, 2 insertions(+)

Thanks, I've applied this patch after slightly tweaking the commit
message (no capitalization on "postgresql", and smaller title, with the
details in the body of the commit log).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
