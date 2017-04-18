From: Kevin JOLY <kevin.joly@sensefly.com>
Date: Tue, 18 Apr 2017 06:18:05 +0200
Subject: [Buildroot] [PATCH v4] libgphoto2: new package
In-Reply-To: <20170413223613.7f78235a@free-electrons.com>
References: <1491894008-29767-1-git-send-email-kevin.joly@sensefly.com>
 <20170413223613.7f78235a@free-electrons.com>
Message-ID: <d9a0740f-39c9-b0c4-c8a3-ddc2b09a3ed4@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for your fixes!

Regards,


Le 13. 04. 17 ? 22:36, Thomas Petazzoni a ?crit :
> Hello,
>
> On Tue, 11 Apr 2017 09:00:08 +0200, Kevin JOLY wrote:
>> Add support for libgphoto2 core library designed to allow access to
>> digital camera.
>>
>> Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
>> Cc: Romain Naour <romain.naour@gmail.com>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> Changes v3 -> v4 (suggested by Arnout Vandecappelle and Romain Naour)
>>    - Fix style issues
>>    - Replace the libjpeg optional dependency by jpeg
>>    - Improve configure options
> I've applied to master, after fixing/improving a few remaining things:
>
>      [Thomas:
>       - Use downloads.sourceforge.net
>       - Remove final dot at end of <pkg>_LICENSE variable
>       - Minor tweaks in comments.]
>
> Thanks!
>
> Thomas

-- 

*Kevin JOLY*
Embedded systems engineer

SenseFly <http://www.sensefly.com/>
38, rte de Gen?ve
1033 Cheseaux-Lausanne, Switzerland

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170418/f15704fc/attachment.html>
