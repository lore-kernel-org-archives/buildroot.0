From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:03:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxmlrpc: add openssl optional
 dependency
In-Reply-To: <20200622054708.1885805-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 22 Jun 2020 07:47:08 +0200")
References: <20200622054708.1885805-1-fontaine.fabrice@gmail.com>
Message-ID: <87pn8vv6wn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Without this patch, openssl_abyss is enabled if openssl is built before
 > libxmlrpc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
