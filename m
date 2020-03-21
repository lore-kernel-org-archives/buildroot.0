From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 16:37:11 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/rcw: add missing host-python
 dependency
In-Reply-To: <20200319093057.11386-1-laurent.hartanerot@gmail.com>
References: <20200319065650.28486-1-laurent.hartanerot@gmail.com>
 <20200319093057.11386-1-laurent.hartanerot@gmail.com>
Message-ID: <20200321163711.5986c3a3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Mar 2020 10:30:57 +0100
Laurent Hartanerot <laurent.hartanerot@gmail.com> wrote:

> From: Laurent Hartanerot <laurent.hartanerot@atos.net>
> 
> The rcw tool that compiles RCW sources file need host-python
> 
> Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
> ---
>  package/rcw/rcw.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
