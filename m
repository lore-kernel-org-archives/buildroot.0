From: Arnaud Aujon <arnaud@intelibre.fr>
Date: Tue, 05 Aug 2014 09:41:48 +0200
Subject: [Buildroot] [PATCH v10] espeak: new package
In-Reply-To: <20140804224202.0eb57098@free-electrons.com>
References: <1398867713-3604-1-git-send-email-arnaud@intelibre.fr>
 <20140804224202.0eb57098@free-electrons.com>
Message-ID: <53E08ABC.9070900@intelibre.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for applying !

I will have a look at the new upstream version shortly and send a patch 
if needed.

Regards,

Arnaud

On 08/04/2014 10:42 PM, Thomas Petazzoni wrote:
> Hello Arnaud,
>
> On Wed, 30 Apr 2014 16:21:53 +0200, arnaud at intelibre.fr wrote:
>
>>   package/Config.in                                  |  1 +
>>   package/espeak/Config.in                           | 41 ++++++++++++++++++++
>>   .../espeak-01-do-not-compil-when-install.patch     | 15 ++++++++
>>   package/espeak/espeak.mk                           | 44 ++++++++++++++++++++++
>>   4 files changed, 101 insertions(+)
>>   create mode 100644 package/espeak/Config.in
>>   create mode 100644 package/espeak/espeak-01-do-not-compil-when-install.patch
>>   create mode 100644 package/espeak/espeak.mk
> Thanks a lot, I've applied your patch! I've done some really minor
> formatting tweaks in Config.in and espeak.mk, but other than that, just
> applied as is.
>
> Could you send a followup patch bumping espeak to the newer upstream
> version, if that makes sense?
>
> Thanks!
>
> Thomas
