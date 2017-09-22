From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 22 Sep 2017 08:20:47 +0200
Subject: [Buildroot] [PATCH] package/dfu-util: allow to build it for the
 target as well
In-Reply-To: <f95704df-2a65-18d5-d241-a3cc2e3d1173@mind.be>
References: <cb5803af-b598-5a40-b0ae-25b560f91dc7@grandegger.com>
 <f95704df-2a65-18d5-d241-a3cc2e3d1173@mind.be>
Message-ID: <7cf33e1f-cc70-ac01-fa23-e9f139ba2c5c@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Am 21.09.2017 um 23:09 schrieb Arnout Vandecappelle:
> 
> 
> On 20-09-17 17:31, Wolfgang Grandegger wrote:
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> 
>   Have you tested this at all?
> 
> Makefile:537: *** libusb is in the dependency chain of dfu-util that has added
> it to its _DEPENDENCIES variable without selecting it or depending on it from
> Config.in.  Stop.
> 
>   And therefore you also need to propagate the threads dependency and add a comment.

Ah, yes, a build from scratch does show that issue, sorry! Will send v2.

Wolfgang.
