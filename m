From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 09:28:58 +0200
Subject: [Buildroot] [PATCH 2/3] gnupg2: security bump to version 2.2.6
In-Reply-To: <72dfe4457476a4e00aa7ab1d7bdf57d5ab0c1dc7.1523957833.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 17 Apr 2018 12:37:12 +0300")
References: <d59c6c57aff0a6c8966f33b2ee80bfa6328723f5.1523957833.git.baruch@tkos.co.il>
 <72dfe4457476a4e00aa7ab1d7bdf57d5ab0c1dc7.1523957833.git.baruch@tkos.co.il>
Message-ID: <87d0yfltqd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-9234: Unenforced configuration allows for apparently
 > valid certifications actually signed by signing subkeys.

 > Remove --disable-doc from configure options. We pass this options to all
 > autotools packages.

 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
