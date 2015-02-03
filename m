From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 17:58:12 +0100
Subject: [Buildroot] [PATCH 1/1] xterm: add support for 256 colors
In-Reply-To: <1418137759-12514-1-git-send-email-tbultel@free.fr>
References: <1418137759-12514-1-git-send-email-tbultel@free.fr>
Message-ID: <20150203175812.530256e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Tue,  9 Dec 2014 16:09:19 +0100, Thierry Bultel wrote:
> Signed-off-by: Thierry Bultel <tbultel@free.fr>
> ---
>  package/xterm/Config.in | 9 +++++++++
>  package/xterm/xterm.mk  | 4 ++++
>  2 files changed, 13 insertions(+)

Adding a condition for such a small feature in a package that anyway
has a huge dependency such as X.org didn't seem really useful, so I've
dropped the additional config option, and just enabled 256 colors
support unconditionally.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
