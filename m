From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 17:59:41 +0200
Subject: [Buildroot] [PATCH 4/7] support/testing: move BRTest
 initialisation to __init__
In-Reply-To: <20170709232123.30120-5-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
 <20170709232123.30120-5-arnout@mind.be>
Message-ID: <20170710175941.00af6974@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 01:21:20 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> BRTest's setUp() method contains a few assignments that initialize its
> member variables. Since we will want to use these in test case
> overrides, move them to the __init__ function.
> 
> Also allow the config member to be overridden, rather than always
> taking the class member.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/testing/infra/basetest.py | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
