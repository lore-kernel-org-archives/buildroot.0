From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 13:35:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/sslh: drop C++ dependency
In-Reply-To: <20201012201849.3040707-1-fontaine.fabrice@gmail.com>
References: <20201012201849.3040707-1-fontaine.fabrice@gmail.com>
Message-ID: <20201013133507.6a2b1957@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Oct 2020 22:18:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> sslh is written in plain C so drop C++ dependency
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sslh/Config.in | 5 -----
>  1 file changed, 5 deletions(-)

Both applied. Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
