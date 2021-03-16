From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 22:54:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/libeXosip2: fix build with
 libressl
In-Reply-To: <20210306143512.2279505-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 6 Mar 2021 15:35:12 +0100")
References: <20210306143512.2279505-1-fontaine.fabrice@gmail.com>
Message-ID: <87a6r2zrvt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build with libressl is broken since version 5.1.0 and
 > https://git.savannah.nongnu.org/cgit/exosip.git/commit/?id=d7488b7bbf59870192372384ef338a44be23e888

 > For an unknown reason, we only have one autobuilder failure with version
 > 5.2.0

 > Fixes:
 >  - http://autobuild.buildroot.org/results/89d8d4ba99d6dcc1618cf6b5302c124a92d75be9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
