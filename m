From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 09:26:37 +0100
Subject: [Buildroot] [PATCH 13/16] package/tar: add support for acl and
 xattr
In-Reply-To: <1421684056-5266-14-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-14-git-send-email-maxtram95@gmail.com>
Message-ID: <20150202092637.32a646ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:13 +0200, Maxim Mikityanskiy wrote:
> If acl or attr is going to be installed, add support for them to tar.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  package/tar/tar.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied, thanks! I added a 'else' condition, which makes sure to
explicitly disable the acl and attr support when the corresponding
packages are not available.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
