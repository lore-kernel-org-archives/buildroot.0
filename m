From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Nov 2017 23:03:31 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <3f7fff7b-be5a-42ff-985f-0e860c98acb3@mind.be>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
 <20171102230602.3c61e8d2@windsurf> <20171102221847.GA23314@scaer>
 <20171102232345.5a434af8@windsurf>
 <3f7fff7b-be5a-42ff-985f-0e860c98acb3@mind.be>
Message-ID: <20171104230331.7ee309cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Nov 2017 20:56:55 +0100, Arnout Vandecappelle wrote:

>  I vaguely remember a recently added package where the daemon would silently
> fail to start if the config file is missing, and which doesn't even have a
> default config file. So I think checking for existence of the config file in the
> init script (if the config file is mandatory) makes sense.

So I suppose your suggestion is that the init script should abort with
a failure if the configuration file doesn't exist. Correct?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
