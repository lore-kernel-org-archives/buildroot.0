From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:33:07 +0100
Subject: [Buildroot] [PATCH 1/2] norm: new package
In-Reply-To: <56E88B0F.4040107@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 15 Mar 2016 19:22:07 -0300")
References: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
 <8737rr8km2.fsf@dell.be.48ers.dk> <56E8893D.8000505@zacarias.com.ar>
 <87zitz5qq7.fsf@dell.be.48ers.dk> <56E88B0F.4040107@zacarias.com.ar>
Message-ID: <87vb4n5q3g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 15/03/16 19:19, Peter Korsgaard wrote:
 >> Ok, and that is the case for samba4 as well?

 > No, samba4 is still using an old waf (1.5.x) which requires python2.
 > But since samba4 uses python2 (target) it's getting the host python2
 > for free, we might just add it for cosmetics (graph-depends).

Ok, thanks. Will you send a patch?

-- 
Venlig hilsen,
Peter Korsgaard 
