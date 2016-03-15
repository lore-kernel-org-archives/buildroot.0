From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:19:28 +0100
Subject: [Buildroot] [PATCH 1/2] norm: new package
In-Reply-To: <56E8893D.8000505@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 15 Mar 2016 19:14:21 -0300")
References: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
 <8737rr8km2.fsf@dell.be.48ers.dk> <56E8893D.8000505@zacarias.com.ar>
Message-ID: <87zitz5qq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> E.G. everything else than samba4 uses host-python2.

 > Hi Peter.
 > I can't speak for all the rest, but norm uses waf 1.8.11 (I.E. 1.8.x
 > series) which works fine with python2 or python3, so as long as
 > there's one host python (at least 2.5) everything should be fine
 > (covered by the prereqs, and waf is pretty much self-contained).

Ok, and that is the case for samba4 as well?

-- 
Venlig hilsen,
Peter Korsgaard 
