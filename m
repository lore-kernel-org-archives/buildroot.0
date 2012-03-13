From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Mar 2012 10:14:23 -0300
Subject: [Buildroot] [PATCH] lua: fix non-shared library build
In-Reply-To: <1331475896-13161-1-git-send-email-arnout@mind.be>
References: <1331475896-13161-1-git-send-email-arnout@mind.be>
Message-ID: <55b8cd4ec11585ad284c630188569674@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-11 11:24, Arnout Vandecappelle (Essensium/Mind) wrote:

> Building without BR2_PACKAGE_LUA_SHARED_LIBRARY failed because of
> missing -ldl.  dl is used by lua's dynamic module loading.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
