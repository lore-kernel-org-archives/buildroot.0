From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jun 2019 11:03:16 +0200
Subject: [Buildroot] [PATCHv3 1/2] utils/test-pkg: fix long option
 parsing
In-Reply-To: <20190623165047.GI13664@scaer> (Yann E. MORIN's message of "Sun, 
 23 Jun 2019 18:50:47 +0200")
References: <20190205212142.2244-1-patrickdepinguin@gmail.com>
 <20190623165047.GI13664@scaer>
Message-ID: <871rzijauj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2019-02-05 22:21 +0100, Thomas De Schampheleire spake thusly:
 >> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 >> 
 >> The long option parsing of test-pkg is broken because:
 >> - some long options are not declared
 >> - there should be a comma between long options, the colon does not replace
 >> it.
 >> 
 >> This change also revealed that the declaration of 'toolchains-dir' should
 >> have been 'toolchains-csv', originally introduced in commit ed59f81a3cb4ddb.
 >> 
 >> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 > Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
