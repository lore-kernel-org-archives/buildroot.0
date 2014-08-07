From: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
Date: Thu, 7 Aug 2014 13:52:33 -0700
Subject: [Buildroot] [PATCH 1/1] wpa-supplicant: Add NL80211 support
	option
In-Reply-To: <53E3E37C.3080605@zacarias.com.ar>
References: <1407443308-20000-1-git-send-email-jtheou@adeneo-embedded.us>
 <53E3E37C.3080605@zacarias.com.ar>
Message-ID: <53E3E711.7000505@adeneo-embedded.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI,

Ok, please discard the patch.

IMHO, wpa_supplicant should provide the support of NL80211 by default 
('depends on BR2_PACKAGE_LIBNL) since it's the new standard.

I wasn't expected to have to select LIBNL manually.

Best regards,
On 08/07/2014 01:37 PM, Gustavo Zacarias wrote:
> On 08/07/2014 05:28 PM, Jean-Baptiste Theou wrote:
>
>> Signed-off-by: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
>> ---
>>   package/wpa_supplicant/Config.in         | 6 ++++++
>>   package/wpa_supplicant/wpa_supplicant.mk | 6 ++++++
>>   2 files changed, 12 insertions(+)
> Hi.
> Hmmm why?
> This is done automatically if the libnl package is selected/around.
> We really don't want to thread too thin into hostapd & wpa_supplicant
> config options.
> Regards.
>
>

-- 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140807/d41578fa/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.jpg
Type: image/jpeg
Size: 8458 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140807/d41578fa/attachment.jpg>
