From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 14:05:21 +0100
Subject: [Buildroot] [PATCH 1/12] Revert "package/mongodb: remove
 package"
In-Reply-To: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210140521.545009de@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Feb 2019 12:45:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This reverts commit 13ccd7e7fef7a353151cd61cd3ecd6590dfb3ddf.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

If we apply just this commit, we re-introduce the build failure with
OpenSSL 1.1, which was the reason for dropping mongodb in the first
place.

Bestregards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
