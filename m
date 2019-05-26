From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 20:51:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/pseudo: remove package
In-Reply-To: <20190526154337.24842-1-fontaine.fabrice@gmail.com>
References: <20190526154337.24842-1-fontaine.fabrice@gmail.com>
Message-ID: <20190526205132.41d353fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 May 2019 17:43:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pseudo is not used and fails to build without xattr so remove it
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

We have a patch from you in patchwork that was fixing the xattr issue,
and bumping this package. Why did you change your mind ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
