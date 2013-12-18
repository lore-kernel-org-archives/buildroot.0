From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Dec 2013 10:49:30 +0100
Subject: [Buildroot] [PATCH 1/2] blackbox: rename patches to add
 sequence numbers
In-Reply-To: <1387296884-27777-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1387296884-27777-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20131218104930.0983eeac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 17 Dec 2013 16:14:43 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...0.70.1-gcc43.patch => blackbox-002-gcc43.patch} |    0
>  ... blackbox-003-gcc46-textpropertytostring.patch} |    0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/blackbox/{blackbox-0.70.1-gcc43.patch => blackbox-002-gcc43.patch} (100%)
>  rename package/blackbox/{blackbox-0.70.1-gcc46-textpropertytostring.patch => blackbox-003-gcc46-textpropertytostring.patch} (100%)

It is a little bit weird that the first patch was not renamed in this
commit, but instead renamed in PATCH 2/2, mixed with some other changes
in the patch itself.

Both patches have now be applied by Peter, so it's too late, but it
would have been good to get this right.

Thanks for those contributions anyway!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
