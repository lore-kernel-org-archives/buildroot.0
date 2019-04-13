From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 21:16:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: drop unneeded
 static openssl workaround
In-Reply-To: <20190413091246.27331-1-fontaine.fabrice@gmail.com>
References: <20190413091246.27331-1-fontaine.fabrice@gmail.com>
Message-ID: <20190413211645.3c8a517b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Apr 2019 11:12:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> sconeserver can't be built statically since commit
> a845798aa8af0535b85ea0e46cc9e8af9d1ffed1
> 
> So drop unneeded workaround for statically linking with openssl
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sconeserver/sconeserver.mk | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
