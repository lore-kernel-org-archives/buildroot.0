From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 23:56:48 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/libllcp: drop wrong comment
In-Reply-To: <20201213220329.735998-1-fontaine.fabrice@gmail.com>
References: <20201213220329.735998-1-fontaine.fabrice@gmail.com>
Message-ID: <20201230235648.168f48ba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Dec 2020 23:03:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Dependency on threads comes from libllcp itself not from libusb (which
> is not even selected)
> 
> While at it, also add a comment about this dependency
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Add a comment

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
