From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Oct 2014 21:05:35 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: use select instead of
	epoll
In-Reply-To: <1412193302-5794-1-git-send-email-limpens@gmail.com> (Eric
 Limpens's message of "Wed, 1 Oct 2014 21:55:02 +0200")
References: <1412193302-5794-1-git-send-email-limpens@gmail.com>
Message-ID: <877g0il2bk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Limpens <limpens@gmail.com> writes:

 > As discussed with Gustavo on the mailing-list, remove EPOLL flag.
 > wpa_supplicant isn't able to answer DBUS message as events are
 > never delivered.

 > Signed-off-by: Eric Limpens <limpens@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
