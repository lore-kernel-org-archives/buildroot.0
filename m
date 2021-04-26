From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 16:56:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnpupnp: bump to version 4.1.3
In-Reply-To: <87czuhcg9c.fsf@tarshish> (Baruch Siach's message of "Mon, 26 Apr
 2021 16:44:15 +0300")
References: <20210412080402.75059-1-joerg.krause@embedded.rocks>
 <874kftmdm0.fsf@dell.be.48ers.dk> <87czuhcg9c.fsf@tarshish>
Message-ID: <8735vdjdr4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Mon, Apr 26 2021, Peter Korsgaard wrote:

 >>>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
 >> 
 >> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 >> 
 >> Committed to 2021.02.x, thanks.

 > Not in 2021.02.x as of commit 2960953b0ab6de.

No indeed, I sent the mail too soon. I misremembered what version we
have in 2021.02.x.

 > What is the reason to commit to 2021.02.x?

 > Master branch commit adea5b316e27a is the 4.1.4 bump which includes a
 > security fix.

Exactly because of the 4.1.4 security fix. The changelog is very light
on detail about what got fixed and what versions are affected, but it is
presumably this commit:

https://framagit.org/medoc92/npupnp/-/commit/90a4ab27dcec97d85168204ac8aed98f9f50e184

I'll take a closer look tonight and then update 2021.02.x to 4.1.4.

-- 
Bye, Peter Korsgaard
