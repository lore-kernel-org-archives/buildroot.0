From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 13:50:02 +0100
Subject: [Buildroot] [PATCH 3/3] graph-depends: split off get_rdepends
 from get_depends
In-Reply-To: <20170203205745.14488-5-patrickdepinguin@gmail.com>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-5-patrickdepinguin@gmail.com>
Message-ID: <20170206135002.6dd292ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Feb 2017 21:57:45 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The use of a 'rule' variable that can contain 'show-depends' or
> 'show-rdepends' is not logical if get_depends is considered as a reusable
> function from various scripts. The name of these rules are too much an
> implementation detail.
> 
> Therefore, split the existing get_depends into two separate functions
> get_depends and get_rdepends, while keeping code duplication to a minimum.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/scripts/graph-depends |  6 +++---
>  support/scripts/pkgutil.py    | 17 +++++++++++++----
>  2 files changed, 16 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
