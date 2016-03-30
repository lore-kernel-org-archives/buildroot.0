From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 19:41:09 +0200
Subject: [Buildroot] [PATCHv3] package/tvheadend: use wizard mode on
 first run
In-Reply-To: <1459178147-1201-1-git-send-email-yann.morin.1998@free.fr>
References: <1459178147-1201-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160330194109.67882724@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 17:15:47 +0200, Yann E. MORIN wrote:
> The format of the ACL database in tvheadend has changed, and generating
> a default user is a little bit more involved than just dumping a file in
> the correct locations: filenames are now md5sum (of something?) and the
> usernames and passwords now have their own DB.
> 
> However, tvheadend has a wizard mode, where it is possible to configure
> the basic features, of which creating an admin user.
> 
> We remove our canned ACL database, and change the startup script to
> start in wizard mode on first run. We also switch to using our infra to
> set the permissions.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v2 -> v3:
>   - use the infra to set permissions

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
