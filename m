From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:45:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: add optional hidapi
 dependency
In-Reply-To: <20200111150749.1253467-1-fontaine.fabrice@gmail.com>
References: <20200111150749.1253467-1-fontaine.fabrice@gmail.com>
Message-ID: <20200112224532.3e61e504@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jan 2020 16:07:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> hidapi dependency has been added since version 0.5.2 and
> https://github.com/sigrokproject/libsigrok/commit/4417074c68ce998c2d666fc8a034204a1b74fc2f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libsigrok/libsigrok.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
