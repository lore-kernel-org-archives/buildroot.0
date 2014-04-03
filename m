From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:13:01 +0200
Subject: [Buildroot] [PATCH 1/2] gettext: make host gettextize
 non-interactive
In-Reply-To: <1396532611-30218-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396532611-30218-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140403201301.7fd7848f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  3 Apr 2014 10:43:30 -0300, Gustavo Zacarias wrote:
> Make the host gettextize tool non-interactive to avoid stalling for user
> confirmation when using it to fix up a package.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gettext/gettext.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
