From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 16:14:17 +0200
Subject: [Buildroot] [PATCH] openssh: security bump to version 7.8
In-Reply-To: <151004584b68ecae441b439ec19b195afb2d6b8f.1535086574.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 24 Aug 2018 07:56:14 +0300")
References: <151004584b68ecae441b439ec19b195afb2d6b8f.1535086574.git.baruch@tkos.co.il>
Message-ID: <87mut660jq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-15473: user enumeration vulnerability due to not delaying
 > bailout for an invalid authenticating user until after the packet
 > containing the request has been fully parsed.

 > Some OpenSSH developers don't consider this a security issue:

 >   https://lists.mindrot.org/pipermail/openssh-unix-dev/2018-August/037138.html

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
