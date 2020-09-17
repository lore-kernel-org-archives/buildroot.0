From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:35:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version
 0.10.0
In-Reply-To: <20200916100830.24731-1-jubalh@iodoru.org>
References: <20200916100830.24731-1-jubalh@iodoru.org>
Message-ID: <20200917223544.05051ae4@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 12:08:30 +0200
Michael Vetter <jubalh@iodoru.org> wrote:

> Changes:
>   * Coding style has been unified
>   * SCRAM-SHA-256 and SCRAM-SHA-512 support
>   * c-ares support
>   * LibreSSL support
>   * Introduced global timed handlers that fire periodically regardless of connections status, such a handler can be used to implement deferred re-connection
>   * examples/register implements XEP-0077
>   * Fixed issue with IPv6 on Windows (#153)
>   * Improved portability across systems such as Haiku, Windows
>   * New API:
>     - xmpp_stanza_get_child_by_name_and_ns()
>     - xmpp_conn_is_connecting()
>     - xmpp_conn_is_connected()
>     - xmpp_conn_is_disconnected()
>     - xmpp_stanza_new_from_string()
>     - xmpp_stanza_add_child_ex()
>     - xmpp_stanza_get_context()
>     - xmpp_stanza_reply_error()
>     - xmpp_global_timed_handler_add()
>     - xmpp_global_timed_handler_delete()
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>
> ---
>  package/libstrophe/libstrophe.hash | 2 +-
>  package/libstrophe/libstrophe.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
