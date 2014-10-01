From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 01 Oct 2014 17:02:06 -0300
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: use select instead of
 epoll
In-Reply-To: <1412193302-5794-1-git-send-email-limpens@gmail.com>
References: <1412193302-5794-1-git-send-email-limpens@gmail.com>
Message-ID: <542C5DBE.3070506@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/01/2014 04:55 PM, Eric Limpens wrote:

> As discussed with Gustavo on the mailing-list, remove EPOLL flag.
> wpa_supplicant isn't able to answer DBUS message as events are
> never delivered.
> 
> Signed-off-by: Eric Limpens <limpens@gmail.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
