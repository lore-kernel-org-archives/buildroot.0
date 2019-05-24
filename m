From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 22:30:27 +0200
Subject: [Buildroot] [PATCH v2 05/12] package/flare-engine: fix
 BUG_85180 build timeout
In-Reply-To: <6fbb9a9d-b836-97dd-5bd2-f9d3dcb06a57@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-6-giulio.benetti@micronovasrl.com>
 <20190524215853.4ee3ddbc@windsurf.home>
 <6fbb9a9d-b836-97dd-5bd2-f9d3dcb06a57@micronovasrl.com>
Message-ID: <20190524223027.6d05ee4c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 May 2019 22:05:12 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> > Why does flare-engine need this, but not jasper, which is also a
> > CMake-based package ?  
> 
> Because in flare-engine CMakeLists.txt there is no fallback to -O0, so 
> that was the only decent way to force CMake to generate Makefiles 
> without optimizations.

Could you be more specific ? How does it work for jasper and
libcpprestsdk, which are also based on CMake ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
