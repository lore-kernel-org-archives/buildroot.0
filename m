From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 20:33:55 +0200
Subject: [Buildroot] [PATCH] package/intel-microcode: security bump to
 version 20210216
In-Reply-To: <20210517175125.GC2506@scaer> (Yann E. MORIN's message of "Mon,
 17 May 2021 19:51:25 +0200")
References: <20210517173830.25189-1-peter@korsgaard.com>
 <20210517175125.GC2506@scaer>
Message-ID: <87eee5nrak.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> +++ b/package/intel-microcode/intel-microcode.hash
 >> @@ -1,3 +1,3 @@
 >> # Locally computed
 >> -sha256  e42a264b7b86e80d013d6d00062467352c1f37e0aaea10fe5b51e4d8687921ab  intel-microcode-20201118.tar.gz
 >> -sha256  d9e989e1a7747f3ce93cb749aceca67a430d36c9bebc6e3205e0b3af3ca6304b  license
 >> +sha256  b855c81f78705f35341248a0603aa1a6e199ca7f59cd425e061b579329aa9eaa  intel-microcode-20210216.tar.gz
 >> +sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license

 > We like to have a quick explanation about why the hash of a license file
 > changes. In this case, I've explained that's because the year changed.

Ups, indeed - Forgot to add that.

 > Applied to master, thanks.

Thanks!

-- 
Bye, Peter Korsgaard
