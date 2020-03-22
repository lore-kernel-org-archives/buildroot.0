From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:10:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/bearssl: needs -fPIC
In-Reply-To: <20200310194546.2347-1-fontaine.fabrice@gmail.com>
References: <20200310194546.2347-1-fontaine.fabrice@gmail.com>
Message-ID: <20200322221018.243a4daa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 20:45:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/e677519c7536447062bf15fb7aa73eded19a6cf6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bearssl/bearssl.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
