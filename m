From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 16:16:18 +0100
Subject: [Buildroot] [PATCH 1/3] package/lua-debug: new package
In-Reply-To: <CAB0FRssfuEbz=KUdcpaaoeJd+a1Yoo-URrjvFf1N8L3Csxdr1Q@mail.gmail.com>
References: <1545957452-9451-1-git-send-email-james.hilliard1@gmail.com>
 <CAB0FRssfuEbz=KUdcpaaoeJd+a1Yoo-URrjvFf1N8L3Csxdr1Q@mail.gmail.com>
Message-ID: <20181228161618.39acb1bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Thanks a lot for your feedback on this series.

On Fri, 28 Dec 2018 15:32:39 +0100, Fran?ois Perrad wrote:

> > +# lua-debug
> 
> This rock uses the namespace std.
> So, in order to avoid future name collision, it must be named lua-std-debug

Just for my own understanding, could you give a few more details about
this? We don't have any package today named lua-std-<something>, so I'm
interested in understanding this "namespace std" thing and the
namespace pollution issue.

Also, is your automated luarocks package generation logic
(http://patchwork.ozlabs.org/patch/1015895/) going to name such a
package lua-std-debug and not lua-debug ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
