From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat, 02 May 2015 19:22:05 +0200
Subject: [Buildroot] [PATCH v2] php.ini: set date.timezone
In-Reply-To: <20150502191842.0eec6479@free-electrons.com>
References: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>	<1430579415-22802-3-git-send-email-bos@je-eigen-domein.nl>
 <20150502191842.0eec6479@free-electrons.com>
Message-ID: <554507BD.8010401@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/2015 07:18 PM, Thomas Petazzoni wrote:
> Dear Floris Bos,
>
> On Sat,  2 May 2015 17:10:15 +0200, Floris Bos wrote:
>
>> +ifeq ($(BR2_TARGET_LOCALTIME),)
>> +PHP_LOCALTIME = UTC
>> +else
>> +PHP_LOCALTIME = $(BR2_TARGET_LOCALTIME)
> I suppose you tested that a qstrip call is not needed here.

Yes.
Quotes are fine in php.ini


Yours sincerely,

Floris Bos
