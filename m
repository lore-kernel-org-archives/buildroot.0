From: Andreas Naumann <dev@andin.de>
Date: Mon, 16 Mar 2020 23:40:14 +0100
Subject: [Buildroot] [PATCH v6 23/28] package/qt5webengine: add
 libXdamage as XCB dependency
In-Reply-To: <20200312091553.5498289b@windsurf>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-24-anaumann@ultratronik.de>
 <20200312091553.5498289b@windsurf>
Message-ID: <2edb848b-0d0f-2c01-edc5-7e412c83ba11@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 12.03.20 09:15, Thomas Petazzoni wrote:
> On Mon, 17 Feb 2020 22:23:45 +0100
> Andreas Naumann <anaumann@ultratronik.de> wrote:
> 
>> Fixes a build failure.
>>
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> 
> Could you provide the Buildroot configuration that exhibits the issue?

it was imx6-sabresd_qt5_defconfig plus everything Qt I could find. See 
cover letter near the end.

> I've been trying to create a configuration that builds qt5webengine
> with X.org enabled, and no matter what I do, the OpenGL provider I use
> selects libxdamage, so I don't have a configuration that combines
> qt5webengine and X.org, but without having libxdamage.

Maybe this was fixed with e79ee3b, I will try again.


regards,
Andreas

> 
> Also, what was the build failure ?
> 
> Thanks!
> 
> Thomas
> 
