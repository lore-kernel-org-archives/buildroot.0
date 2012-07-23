From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 Jul 2012 09:42:31 -0300
Subject: [Buildroot] [PATCH 2/6] radvd: bump to version 1.9.1
In-Reply-To: <20120722210439.5b3c0dec@skate>
References: <1342360065-10106-1-git-send-email-gustavo@zacarias.com.ar>
 <1342360065-10106-2-git-send-email-gustavo@zacarias.com.ar>
 <20120722210439.5b3c0dec@skate>
Message-ID: <500D46B7.8060501@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/22/12 16:04, Thomas Petazzoni wrote:

> Le Sun, 15 Jul 2012 10:47:41 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
> 
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> I don't know if it is related to this bump, but we have build failures
> on radvd since a few days. See
> http://autobuild.buildroot.org/results/48aabbc41dff2e4196dfd6e1e942cf6dbe050deb/build-end.log
> for example. Do you have the time to look into this?
> 
> Thanks a lot!
> 
> Thomas

Hi Thomas, sure.
Give the patch i'm sending a try, it should fix it since it's a wrong
Makefile dependency breaking highly-parallel builds. It doesn't seem to
break for me (4-core) but i can see how it could on other scenarios.
Not yet upstream until i get an OK (and subscribe to the radvd-devel ML
which seems slow for some reason).
Regards.
