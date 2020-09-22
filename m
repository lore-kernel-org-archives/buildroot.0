From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 22:02:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/qprint: new package
In-Reply-To: <20200920213636.132481-1-alejandro.gonzalez.correo@gmail.com>
References: <20200920213636.132481-1-alejandro.gonzalez.correo@gmail.com>
Message-ID: <20200922220232.12624065@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 23:36:36 +0200
Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com> wrote:

> qprint is a small utility that handles encoding and decoding arbitrary
> binary data in the Quoted-Printable format, which was introduced along
> MIME.
> 
> As stated in the package description, although MUAs nowadays usually
> take care of doing this encoding themselves, there are some use cases
> where doing it manually is needed, and providing a command-line program
> to do it is amenable to shell scripts.
> 
> Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/qprint/Config.in   | 18 ++++++++++++++++++
>  package/qprint/qprint.hash |  3 +++
>  package/qprint/qprint.mk   | 13 +++++++++++++
>  5 files changed, 36 insertions(+)
>  create mode 100644 package/qprint/Config.in
>  create mode 100644 package/qprint/qprint.hash
>  create mode 100644 package/qprint/qprint.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
