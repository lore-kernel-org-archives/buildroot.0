From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 03 Feb 2011 12:08:35 -0300
Subject: [Buildroot] [PATCH] qt: add option to hide mouse cursor
In-Reply-To: <1296688004-27884-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1296688004-27884-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <4D4AC4F3.9030700@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/11 20:06, Daniel Nystr?m wrote:

> Allow the user to build Qt with the QT_NO_QWS_CURSOR macro set.
> 
> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
> ---
>  package/qt/Config.mouse.in |    7 +++++++
>  package/qt/qt.mk           |    3 +++
>  2 files changed, 10 insertions(+), 0 deletions(-)

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
