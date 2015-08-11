From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Aug 2015 10:13:33 +0200
Subject: [Buildroot] .hash files for all packages?
In-Reply-To: <20150810204725.GG3676@free.fr>
References: <1438682248-29767-1-git-send-email-joerg.krause@embedded.rocks>
 <20150810162227.6a3cde19@free-electrons.com>
 <1439217249.5186.18.camel@embedded.rocks>
 <20150810205427.156aa7b9@free-electrons.com>
 <20150810204725.GG3676@free.fr>
Message-ID: <20150811101333.2fd48c22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 10 Aug 2015 22:47:25 +0200, Yann E. MORIN wrote:

> I think the overall goal is to have .hash files for all packages. Having
> a .hash files for all packages would allow us to make hashes truly
> mandatory, and make a missing .hash file an error, rather than the
> warning it is today.
> 
> Which in turn would ensure we have hashes for all packages for which it
> makes sense.
> 
> Of course, that would mean adding a 'none' hash for those packages for
> which we can't have  ahash (like the github helper, or any git/svn/... 
> checkouts.
> 
> So, what J?rg did was in my opinion correct, even if we did not
> explicitly document that! ;-)

Ok. I'm a bit worried about having 220 useless hash files, so I'd like
to hear the opinion of others on that. And once we made our decision,
document it more clearly.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
