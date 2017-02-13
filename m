From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 17:46:08 +0100
Subject: [Buildroot] [PATCH v3] classpath: bump to version 0.99
In-Reply-To: <87wpcukqe1.fsf@dell.be.48ers.dk>
References: <20170212015451.16715-1-m.hoffmann@cartelsol.com>
 <20170212020444.32045-1-m.hoffmann@cartelsol.com>
 <20170212151431.1fe6cce3@free-electrons.com>
 <5160b52a-c48a-4b52-3d0e-9d73a6fb5c37@cartelsol.com>
 <20170213142952.302e6ee4@free-electrons.com>
 <871sv2m5yb.fsf@dell.be.48ers.dk>
 <20170213170918.5428781c@free-electrons.com>
 <87wpcukqe1.fsf@dell.be.48ers.dk>
Message-ID: <20170213174608.1af2c81b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 17:27:18 +0100, Peter Korsgaard wrote:

>  > Agreed. But that creates a kind of weird circular dependency, no?  
> 
>  > Or perhaps we should just get rid of the prompt for classpath
>  > completely?  
> 
> Either that or dropping the 'depends on jamvm' from classpath. It indeed
> isn't very useful without a jvm, but it still builds Ok and I guess a
> lot of other package combinations also don't make a lot of sense.

I think it's a better option than making the classpath package
invisible. Indeed, if we make it invisible, users might wonder if we
have "support" for it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
