From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 20:24:30 +0200
Subject: [Buildroot] [PATCH 15/16] package/vim: add default vimrc
In-Reply-To: <1421684056-5266-16-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-16-git-send-email-maxtram95@gmail.com>
Message-ID: <20150710202430.3bd69bd9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:15 +0200, Maxim Mikityanskiy wrote:
> Support /etc/vim/vimrc as system-wide vimrc file. Add some default
> sample vimrc.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  package/vim/vim.mk | 11 +++++++++++
>  package/vim/vimrc  | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 package/vim/vimrc

I don't think it's really that useful to have a custom vimrc installed
by default. We do install a default config file for daemons when they
need it to have some sane default behavior, but for things like text
editors, I'm not sure it's really worth it.

So I've marked your patch as Rejected in our patch tracking system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
