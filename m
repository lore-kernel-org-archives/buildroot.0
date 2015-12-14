From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 11:37:30 -0300
Subject: [Buildroot] [PATCH 03/45] gst1-plugins-base: comma separate
 licenses
In-Reply-To: <20151214150641.35efe163@free-electrons.com>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
 <1450098684-17399-4-git-send-email-gustavo@zacarias.com.ar>
 <20151214150641.35efe163@free-electrons.com>
Message-ID: <566ED42A.3050105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/12/15 11:06, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
>
> On Mon, 14 Dec 2015 10:10:42 -0300, Gustavo Zacarias wrote:
>
>> -GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
>> +GST1_PLUGINS_BAD_LICENSE_FILES = COPYING, COPYING.LIB
>
> Wrong: the list of license files is space separated, not comma
> separated.

Fixed in v2, another change leaked in by mistake.
Regards.
