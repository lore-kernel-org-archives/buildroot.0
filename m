From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Nov 2014 19:08:18 +0200
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.07
In-Reply-To: <1415203319-30399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415203319-30399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141105170818.GC2234@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Wed, Nov 05, 2014 at 01:01:59PM -0300, Gustavo Zacarias wrote:
> Also enable optional systemd support.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/stunnel/stunnel.hash |  2 +-
>  package/stunnel/stunnel.mk   | 11 +++++++++--
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
> index 89af571..e4e6366 100644
> --- a/package/stunnel/stunnel.hash
> +++ b/package/stunnel/stunnel.hash
> @@ -1,2 +1,2 @@
>  # From http://www.stunnel.org/pipermail/stunnel-announce/2014-October/000084.html

The announcement for 5.07 is at 
http://www.stunnel.org/pipermail/stunnel-announce/2014-November/000085.html.

> -sha256	098c2b6db0793ea4fa5b6767ce6ef1853e9f6cc2f32133024be55f6a460b1a40	stunnel-5.06.tar.gz
> +sha256	505c6c63c4a20fc0cce8c35ef1ab7626c7b01071e3fca4ac6ea417afe8065309	stunnel-5.07.tar.gz

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
