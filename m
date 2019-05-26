From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 22:04:30 +0200
Subject: [Buildroot] [PATCH v2] package/qt5wayland: install compositor
 QML files
In-Reply-To: <20190514071830.30037-1-nowrep@gmail.com>
References: <20190511150750.5985-1-nowrep@gmail.com>
 <20190514071830.30037-1-nowrep@gmail.com>
Message-ID: <20190526220430.46a75047@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 09:18:29 +0200
David Rosca <nowrep@gmail.com> wrote:

> Fixes using QtWayland.Compositor QML import.
> 
> Signed-off-by: David Rosca <nowrep@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - move under BR2_PACKAGE_QT5DECLARATIVE_QUICK condition
>   - also handle stable Qt version (5.6)
> ---
>  package/qt5/qt5wayland/qt5wayland.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
