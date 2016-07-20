From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 23:43:57 +0200
Subject: [Buildroot] [PATCHv2 2/2] package/elementary: add path to
 eolian_cxx
In-Reply-To: <1468875087-17192-2-git-send-email-romain.naour@gmail.com>
References: <1468875087-17192-1-git-send-email-romain.naour@gmail.com>
 <1468875087-17192-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160720234357.705b0540@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 22:51:27 +0200, Romain Naour wrote:
> When efl package is build with Eolian support, eolian_cxx tool is
> build for the host.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: set eolian_cxx path only if Eolian C++ bindings are enabled
>     in the efl stack.
> ---
>  package/elementary/elementary.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
