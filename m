From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 23:58:00 +0100
Subject: [Buildroot] [PATCH 1/1 v2] package/nss-pam-ldapd: new package
In-Reply-To: <1432494752-5077-1-git-send-email-rdkehn@yahoo.com>
References: <1432494752-5077-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20151130235800.77e46f3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Sun, 24 May 2015 14:12:32 -0500, Doug Kehn wrote:
> Name Service Switch (NSS) module that allows your LDAP server to provide
> user account, group, host name, alias, netgroup, and basically any other
> information that you would normally get from /etc flat files or NIS. It
> also provides a Pluggable Authentication Module (PAM) to do
> authentication to an LDAP server.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
> Changes v1 -> v2
>   - Incorporate feedback/suggestions by Yann.

Applied to next, after doing a few minimal changes:

    [Thomas:
     - bump to version 0.9.6
     - use --disable-<foo> rather than --enable-<foo>=no.
     - fix license information: there is no LICENSE file, it is named
       COPYING.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
