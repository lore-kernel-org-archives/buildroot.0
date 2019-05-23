From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 May 2019 15:18:05 +0200
Subject: [Buildroot] [PATCH] package: dropbear: add support for
 displaying /etc/motd
In-Reply-To: <20190523142857.625748aa@windsurf.home> (Thomas Petazzoni's
 message of "Thu, 23 May 2019 14:28:57 +0200")
References: <20190523121115.26098-1-ardeleanalex@gmail.com>
 <20190523142857.625748aa@windsurf.home>
Message-ID: <87k1ehs41e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > This way, we have something that is much more flexible, as it allows
 > you to define whatever Dropbear option you like.

 > Note: this is just a suggestion; I don't know what other
 > maintainers/developers will think about it.

Agreed, if we want such finegrained configuration then that would be the
way to go.

-- 
Bye, Peter Korsgaard
