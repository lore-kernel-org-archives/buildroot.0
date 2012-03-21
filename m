From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Mar 2012 11:15:36 -0300
Subject: [Buildroot] [PATCH v2] ushare: new package
In-Reply-To: <20120321144452.68029160@skate>
References: <1332335538-23508-1-git-send-email-gustavo@zacarias.com.ar>
 <20120321142102.5c5999a6@skate>
 <5f0396764c1dc201f01ae3853a534d33@zacarias.com.ar>
 <20120321144452.68029160@skate>
Message-ID: <94962598dfb4a528705badba7bcf7f89@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-21 10:44, Thomas Petazzoni wrote:

>> Same things applies to ffmpeg and probably others (the ushare 
>> configure
>> is an old/strip version from ffmpeg).
>> Though ffmpeg is using AUTOTARGETS and overriding CONFIGURE_CMDS...
>
> And it is wrong. Not your fault, of course, but I don't think it is 
> an
> argument to make it wrong in other places as well.

I was just saying that many others will require attention to that also 
if the consensus is to do so (with ffmpeg being the configure daddy of 
ushare as a direct example of it).
Regards.
