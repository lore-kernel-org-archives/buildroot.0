From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 21:21:01 +0100
Subject: [Buildroot] [PATCH v2] package/Config.in: explain that lua
 package names should start with lua
In-Reply-To: <20170305222442.27768-1-arnout@mind.be>
References: <20170305222442.27768-1-arnout@mind.be>
Message-ID: <20170306212101.7b021a78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Mar 2017 23:24:42 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> We have decided that lua packages should have a name that starts with
> lua (like is the case for python and perl). However, we're not going to
> rename all the existing lua packages that don't start with lua. This
> makes it unclear for people adding packages how they should name the
> package, so add a comment to package/Config.in to explain it.
> 
> It's rather terse but it gets the message across.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: clarify that lua- should be added if upstream doesn't have a lua
>     prefix
> ---
>  package/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
