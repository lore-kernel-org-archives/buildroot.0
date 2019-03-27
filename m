From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 23:22:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/putty: enable static build
In-Reply-To: <957950c9628264383a7a83b04c082c4b56ef5314.1553624840.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 26 Mar 2019 20:27:19 +0200")
References: <957950c9628264383a7a83b04c082c4b56ef5314.1553624840.git.baruch@tkos.co.il>
Message-ID: <871s2sot3j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch fixing build when NO_GSSAPI is defined which is the
 > case on static builds.

 > Cc: Alexander Dahl <post@lespocky.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
