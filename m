From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Nov 2015 21:39:39 +0100
Subject: [Buildroot] [PATCH 2/2] help: relocate help messages specific
 to one package
In-Reply-To: <20151118154912.408690e7@free-electrons.com>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
 <1447857421-9380-2-git-send-email-jezz@sysmic.org>
 <20151118154912.408690e7@free-electrons.com>
Message-ID: <565B628B.2040107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-11-15 15:49, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 18 Nov 2015 15:37:01 +0100, J?r?me Pouiller wrote:
>> Use $LOCAL_HELP feature in order to integrate help messages specific
>> to one package (linux-menuconfig, etc...) package they are
>> related.
>>
>> It would be possible to do it using kconfig framework, but I was not
>> sure it is necessary to document kconfig targets systematicaly.
>>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>> ---
>>  Makefile                   | 16 ----------------
>>  boot/barebox/barebox.mk    |  5 +++++
>>  linux/linux.mk             |  7 +++++++
>>  package/busybox/busybox.mk |  4 ++++
>>  package/uclibc/uclibc.mk   |  4 ++++
>>  5 files changed, 20 insertions(+), 16 deletions(-)
> 
> I already proposed something achieving a similar thing (but more
> integrated into the package infrastructure) a while ago, and it wasn't
> accepted.
> 
> See:
> 
>   http://lists.busybox.net/pipermail/buildroot/2015-January/118159.html

 Your proposal had a lot more impact. J?r?me's proposal is diffstat-neutral
(except for 4 added empty lines, and with 5 additional lines needed in the infra
in patch 1/2). So I'm not opposed to this proposal at all.


 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
