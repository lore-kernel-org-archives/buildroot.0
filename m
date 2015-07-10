From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 22:44:52 +0200
Subject: [Buildroot] [PATCH v3 1/2] libsodium: new package
In-Reply-To: <1432036871-3244-1-git-send-email-fhunleth@troodon-software.com>
References: <1432036871-3244-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150710224452.31a93cfb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue, 19 May 2015 08:01:10 -0400, Frank Hunleth wrote:
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1 -> v2:
>   - fix curly braces on variables (thanks to Thomas for noticing)
>   - added patch for zeromq (in separate patch) to address libsodium
>     dependency in that library (thanks to Romain for this). I didn't
>     find any other packages with a similar dependency, but it's not
>     that easy to do that search.
> Changes v2 -> v3:
>   - removed host build (thanks to Baruch and Thomas)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
