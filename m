From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 16:57:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/civetweb: add zlib optional
 dependency
In-Reply-To: <20200317211457.1272741-1-fontaine.fabrice@gmail.com>
References: <20200317211457.1272741-1-fontaine.fabrice@gmail.com>
Message-ID: <20200321165729.0fa2b0e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Mar 2020 22:14:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> zlib is an optional dependency since version 1.11 and
> https://github.com/civetweb/civetweb/commit/6b8b15935378f71323ff95f907fa0d33841deac0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/civetweb/civetweb.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
