From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 13:54:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/quota: add autoreconf
In-Reply-To: <20191224080625.564034-1-fontaine.fabrice@gmail.com>
References: <20191224080625.564034-1-fontaine.fabrice@gmail.com>
Message-ID: <20191224135438.4c34992f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Dec 2019 09:06:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit feef4b733c4e5a6ee89d1554d29786304be7a720 added a patch on
> configure.ac but forgot to set QUOTA_AUTORECONF=YES
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/15f2dbfbafc91719ad1f5209811300ddaa5cec91
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/quota/quota.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
