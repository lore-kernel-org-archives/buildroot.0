From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 May 2012 23:44:19 +0200
Subject: [Buildroot] [PATCH] Add package 'opkg'
In-Reply-To: <327c9a85485315c6da4f.1337106863@beantl019720> (Thomas De
 Schampheleire's message of "Tue, 15 May 2012 20:34:23 +0200")
References: <327c9a85485315c6da4f.1337106863@beantl019720>
Message-ID: <87obplmafg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed to next, thanks.

 Thomas> +OPKG_SITE = http://opkg.googlecode.com/files
 Thomas> +OPKG_INSTALL_STAGING = YES
 Thomas> +OPKG_CONF_OPT = --disable-curl --disable-gpg

It would be good to add optional curl support, but that can be done
later.

-- 
Bye, Peter Korsgaard
