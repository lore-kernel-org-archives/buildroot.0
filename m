From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:15:38 +0100
Subject: [Buildroot] [PATCH 1/1] janus-gateway: add option for libcurl
 support
In-Reply-To: <1509704639-20360-1-git-send-email-olivier.maignial@smile.fr>
References: <1509704639-20360-1-git-send-email-olivier.maignial@smile.fr>
Message-ID: <20171123231538.415040b7@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Nov 2017 11:23:59 +0100, Olivier Maignial wrote:
> libcurl is not mandatory to compile Janus, but Janus use it in several way:
>     - RTSP stream support in plugin streaming
>     - TURN REST API support
>     - HTTP backend for text room plugin
>     - ...
> This commit add an option "libcurl support" to add dependency on libcurl.
> 
> Signed-off-by: Olivier Maignial <olivier.maignial@smile.fr>
> ---
>  package/janus-gateway/Config.in        | 18 ++++++++++++++++++
>  package/janus-gateway/janus-gateway.mk |  4 ++++
>  2 files changed, 22 insertions(+)

You received some comments from Adam Duskett on this patch. Do you
think you will be able to send an updated version of this patch that
takes into account the comments?

I will mark your patch as Changes Requested in our patch tracking
system, which means that if you don't resend a new version, we will
forget about your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
