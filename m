From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 14:21:02 +0100
Subject: [Buildroot] [PATCH v3] package/strongswan: Install libraries to
 /usr/lib
In-Reply-To: <1513117178-10061-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1513117178-10061-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <20171213142102.6799c7d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Dec 2017 16:19:38 -0600, Sam Voss wrote:
> Install strongswan ipsec libraries into /usr/lib instead of
> /usr/lib/ipsec to place them in preferred library common location.
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> 
> --
> 
> v2->v3
>  - Update description to not include RPATH issue as it could not be
>     reproduced.
> v1->v2
>  - Specify plugindir and imcvdir to keep default values to avoid them
>     moving when ipseclibdir changes.
> ---
>  package/strongswan/strongswan.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
