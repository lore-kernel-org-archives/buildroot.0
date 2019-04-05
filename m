From: =?utf-8?B?0JvRg9C60YzRj9C90YfRg9C6INCQ0LvQtdC60YHQtdC5?= <skif@skif-web.ru>
Date: Fri, 05 Apr 2019 16:14:10 +0300
Subject: [Buildroot] [PATCH 1/1] Signed-off-by: Alexey Lukyanchuk
 <skif@skif-web.ru>
In-Reply-To: <20190405131111.GA25055@lwo1-lhp-f71841>
References: <20190405122151.2172-1-skif@skif-web.ru>
 <20190405124343.GA18243@lwo1-lhp-f71841>
 <23142141554469083@iva8-d09e540be28d.qloud-c.yandex.net>
 <20190405131111.GA25055@lwo1-lhp-f71841>
Message-ID: <16162891554470050@sas1-633109cb7707.qloud-c.yandex.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, now i will use plain text in emails.

Thanks for fix!

--?
Regards,
Alexey Lukyanchuk
89104434842
skif at skif-web.ru



05.04.2019, 16:11, "Vadym Kochan" <vadim4j@gmail.com>:
> On Fri, Apr 05, 2019 at 03:58:03PM +0300, ????????? ??????? wrote:
>> ?<div xmlns="http://www.w3.org/1999/xhtml">Hi Vadym!<br />I must do new patch or i can correct this patch?</div><div><br /></div><div><br /></div><div>--?</div><div>? ?????????,</div><div>????????? ???????</div><div>89104434842</div><div>skif at skif-web.ru</div><div><br /></div><div><br /></div><div><br /></div><div>05.04.2019, 15:43, "Vadym Kochan" &lt;vadim4j at gmail.com&gt;:</div><blockquote type="cite"><p>Hi Alexey!<br /><br />On Fri, Apr 05, 2019 at 03:21:51PM +0300, Alexey Lukyanchuk wrote:<br /></p><blockquote>?package/freerdp: bump version to 2.0.0-rc4<br /><br />?Add support to set tls security level (for openssl &gt;= 1.1.0), for RDP<br />?protocol version 10(needed for windows 10 and windows server 2016). Also have some fix and features, see<br />?<a href="https://github.com/FreeRDP/FreeRDP/commit/e21b72c95f857817b4b32b5ef5406355c005a9e8">https://github.com/FreeRDP/FreeRDP/commit/e21b72c95f857817b4b32b5ef5406355c005a9e8</a><br /><br />?Signed-off-by: Alexey Lukyanchuk &lt;<a href="mailto:skif@skif-web.ru">skif at skif-web.ru</a>&gt;<br /></blockquote><p><br />Your signed-off appeared in patch subject instead of:<br /></p><blockquote>?package/freerdp: bump version to 2.0.0-rc4<br /></blockquote><p><br /></p><blockquote>?---<br />??package/freerdp/freerdp.hash | 2 +-<br />??package/freerdp/freerdp.mk | 2 +-<br />??2 files changed, 2 insertions(+), 2 deletions(-)<br /><br />?diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash<br />?index 44b7b876a9..7a<span>6859551</span>f 100644<br />?--- a/package/freerdp/freerdp.hash<br />?+++ b/package/freerdp/freerdp.hash<br />?@@ -1,3 +1,3 @@<br />??# Locally calculated<br />?-sha256 a09e338b996fada44bf1277f423240d0fa<span>82289799</span>e2e5dea9d9c<span>63201554</span>de1 freerdp-2.0.0-rc2.tar.gz<br />?+sha<span>256 3406</span>f3bfab63f81c<span>1533029</span>a5bf73949ff60f22f6e155c5a08005b8b8afe6d49 freerdp-2.0.0-rc4.tar.gz<br />??sha256 cfc7749b96f63bd31c3c42b5c471bf<span>756814053</span>e847c10f3eb003417bc523d30 LICENSE<br />?diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk<br />?index 91e4ae47ee..0f32ff<span>4718 100644</span><br />?--- a/package/freerdp/freerdp.mk<br />?+++ b/package/freerdp/freerdp.mk<br />?@@ -4,7 +4,7 @@<br />??#<br />??################################################################################<br /><br />?-FREERDP_VERSION = 2.0.0-rc2<br />?+FREERDP_VERSION = 2.0.0-rc4<br />??FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))<br />??FREERDP_DEPENDENCIES = libglib2 openssl zlib<br />??FREERDP_LICENSE = Apache-2.0<br />?-- <br /></blockquote><p><br />Regards,<br />Vadim Kochan<br /></p></blockquote>
>
> Ohhh, I see a lot of html tags, my mutt can't parse it, I think it would
> be good to use just plain text mode here)
>
> I'd just resend original patch and pointed in the previous email that I
> fixed the subject, I dont think it is needed to send a new versioned
> patch.
>
> Regards,
> Vadim Kochan
