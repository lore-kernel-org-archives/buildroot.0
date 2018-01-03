From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 22:09:15 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: build shared and static library
In-Reply-To: <20171231162933.19446-1-fontaine.fabrice@gmail.com>
References: <20171231162933.19446-1-fontaine.fabrice@gmail.com>
Message-ID: <20180103220915.74379889@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Dec 2017 17:29:33 +0100, Fabrice Fontaine wrote:
> cjson 1.6.0 added the BUILD_SHARED_AND_STATIC_LIBS option which is OFF
> by default so set it depending on BR2_SHARED_STATIC_LIBS value
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cjson/cjson.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

I've added a comment in the .mk file and in the commit log to explain
how BUILD_SHARED_AND_STATIC_LIBS interacts with BUILD_SHARED_LIBS. And
I've applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
