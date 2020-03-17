From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Mar 2020 07:08:00 +0100
Subject: [Buildroot] [PATCH v6 18/28] package/cmake: Fix for using -O in
 top-level make
In-Reply-To: <d6125560-ca00-a4be-cfde-ff200d332756@andin.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-19-anaumann@ultratronik.de>
 <20200311232503.0bafe189@windsurf>
 <33267645-fd49-cb20-bb8f-f6a1edd57a15@mind.be>
 <d6125560-ca00-a4be-cfde-ff200d332756@andin.de>
Message-ID: <20200317070800.6365cac6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Mar 2020 23:15:24 +0100
Andreas Naumann <dev@andin.de> wrote:

> >> This commit log was a bit vague on what the issue was. If I understand  
> 
> The issue was that the cmake configure step stopped with an error if I 
> used the -O option. I dont think it was related to which output strategy 
> was used.

I have not been able to reproduce the CMake configure step failure
then. Are you still able to reproduce this? If so, could you provide
more details about the setup: make version being, exact command line,
Buildroot version, etc ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
