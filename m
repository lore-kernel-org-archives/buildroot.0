From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Feb 2017 17:27:18 +0100
Subject: [Buildroot] [PATCH v3] classpath: bump to version 0.99
In-Reply-To: <20170213170918.5428781c@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 13 Feb 2017 17:09:18 +0100")
References: <20170212015451.16715-1-m.hoffmann@cartelsol.com>
 <20170212020444.32045-1-m.hoffmann@cartelsol.com>
 <20170212151431.1fe6cce3@free-electrons.com>
 <5160b52a-c48a-4b52-3d0e-9d73a6fb5c37@cartelsol.com>
 <20170213142952.302e6ee4@free-electrons.com>
 <871sv2m5yb.fsf@dell.be.48ers.dk>
 <20170213170918.5428781c@free-electrons.com>
Message-ID: <87wpcukqe1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I don't recall the details, but as far as I remember the thinking was
 >> that classpath only made sense if we have a jvm (and jamvm is our only
 >> jvm).

 > Agreed. But that creates a kind of weird circular dependency, no?

 > Or perhaps we should just get rid of the prompt for classpath
 > completely?

Either that or dropping the 'depends on jamvm' from classpath. It indeed
isn't very useful without a jvm, but it still builds Ok and I guess a
lot of other package combinations also don't make a lot of sense.

-- 
Bye, Peter Korsgaard
