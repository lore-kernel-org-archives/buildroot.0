From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:54:19 +0200
Subject: [Buildroot] [PATCH 2/2] statserial: don't link against legacy
 curses
In-Reply-To: <1404493381-24414-3-git-send-email-gustavo@zacarias.com.ar>
References: <1404493381-24414-1-git-send-email-gustavo@zacarias.com.ar>
 <1404493381-24414-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140715205419.018fa7ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  4 Jul 2014 14:03:01 -0300, Gustavo Zacarias wrote:
> Link against libncurses instead of the legacy libcurses.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/statserial/statserial-01-ncurses-link.patch | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 package/statserial/statserial-01-ncurses-link.patch

Applied, thanks. I was going to say "and please send upstream", but
then I realized that there is pretty no upstream for statserial...

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
