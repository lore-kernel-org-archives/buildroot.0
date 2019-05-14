From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 17:45:14 +0200
Subject: [Buildroot] [PATCH] package/qt5base: enable journald logging
In-Reply-To: <20190514074937.3745-1-nowrep@gmail.com>
References: <20190514074937.3745-1-nowrep@gmail.com>
Message-ID: <20190514174514.62501e70@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 09:49:36 +0200
David Rosca <nowrep@gmail.com> wrote:

> Allows Qt applications to log into systemd journal with
> QT_LOGGING_TO_CONSOLE=0 environment variable.
> 
> Signed-off-by: David Rosca <nowrep@gmail.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
