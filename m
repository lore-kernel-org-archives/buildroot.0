From: Martin Kepplinger <martink@posteo.de>
Date: Sat, 29 Apr 2017 14:42:29 +0200
Subject: [Buildroot] [PATCH 1/2] x11r7: xdriver_xf86-input-tslib: new
 upstream location
In-Reply-To: <20170429135844.2fa76511@free-electrons.com>
References: <1493382976-26007-1-git-send-email-martink@posteo.de>
 <20170429135844.2fa76511@free-electrons.com>
Message-ID: <a011515d-d662-c504-fcae-86d7b06ee6bd@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2017-04-29 um 13:58 schrieb Thomas Petazzoni:
> Hello,
> 
> On Fri, 28 Apr 2017 14:36:15 +0200, Martin Kepplinger wrote:
> 
>>  XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
>>  XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
>> -XDRIVER_XF86_INPUT_TSLIB_SITE = http://www.pengutronix.de/software/xf86-input-tslib/download
>> +XDRIVER_XF86_INPUT_TSLIB_SITE = https://github.com/merge/xf86-input-tslib/releases/download/$(TSLIB_VERSION)
> 
> This couldn't work: TSLIB_VERSION comes from tslib.mk and is set to
> 1.9, which prevents the download from working. Changing this to
> XDRIVER_XF86_INPUT_TSLIB_VERSION fixed the problem.
> 
> Applied with this fix. Thanks!
> 

oops. sorry. Should have taken more time to check everything. Thanks!
