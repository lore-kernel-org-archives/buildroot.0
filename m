From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Jun 2021 14:39:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: bump version to
 20.10.7
In-Reply-To: <CA+h8R2oebyEwTb=1NN-hrG=B033Byk+QnFxXns=-agcKN_7PZg@mail.gmail.com>
References: <20210607060730.1476825-1-christian@paral.in>
 <CA+h8R2oebyEwTb=1NN-hrG=B033Byk+QnFxXns=-agcKN_7PZg@mail.gmail.com>
Message-ID: <3fface9a-4f23-2f23-c6b3-b8ce296b6248@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/06/2021 22:21, Christian Stewart wrote:
> I've been testing this and the docker version bump + patch drop both
> appear to work fine.
> 
> On Sun, Jun 6, 2021 at 11:07 PM Christian Stewart <christian@paral.in> wrote:
>> -DOCKER_ENGINE_VERSION = 20.10.6
>> +DOCKER_ENGINE_VERSION = 20.10.7
> 
> Tested-by: Christian Stewart <christian@paral.in>

 It's assumed that you have tested whatever you submit, so adding tested-by for
your own patches is pretty pointless.

 Both applied to master, thanks.

 Regards,
 Arnout
