From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 15:36:44 +0200
Subject: [Buildroot] [PATCH 2/2] cups: disable pam support
In-Reply-To: <20180501112230.eac3ejv6vo54jujb@tarshish> (Baruch Siach's
 message of "Tue, 1 May 2018 14:22:30 +0300")
References: <91db976709291253cb9914a411a9d75872165f75.1525115956.git.baruch@tkos.co.il>
 <399e1f6584e1296686974096bc97c027988f3899.1525115956.git.baruch@tkos.co.il>
 <87zi1jg0x0.fsf@dell.be.48ers.dk>
 <20180501112230.eac3ejv6vo54jujb@tarshish>
Message-ID: <87r2mvfqfn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> Committed, thanks.

 > Not in master as of 24c1751a002b.

Sorry, it is now.

 >> Any specific reason to unconditionally disable this and not enable when
 >> linux-pam is available?

 > I guess that PAM integration takes more than just dependency declaration and 
 > --enable-pam. But I did not look too deeply into that.

Ok.

-- 
Bye, Peter Korsgaard
