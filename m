From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:18:46 +0200
Subject: [Buildroot] [PATCH] libssh: security bump to version 0.8.4
In-Reply-To: <bb0e0a00bfce17b9a32210d153e052d9ac4561c6.1539693068.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 16 Oct 2018 15:31:08 +0300")
References: <bb0e0a00bfce17b9a32210d153e052d9ac4561c6.1539693068.git.baruch@tkos.co.il>
Message-ID: <874ldbd23t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-10933: authentication bypass vulnerability in the server
 > code. By presenting the server an SSH2_MSG_USERAUTH_SUCCESS message in
 > place of the SSH2_MSG_USERAUTH_REQUEST message which the server would
 > expect to initiate authentication, the attacker could successfully
 > authenticate without any credentials.

 >   https://www.libssh.org/security/advisories/CVE-2018-10933.txt

 > Drop an upstream patch.

 > Cc: Scott Fan <fancp2007@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
