From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 22:07:00 +0200
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.2.3
In-Reply-To: <20200508163951.5hf2clb4cysufywb@einstein.dilieto.eu> (Nicola Di
 Lieto's message of "Fri, 8 May 2020 18:39:51 +0200")
References: <20200423055104.lljafbjugkwzbzhm@einstein.dilieto.eu>
 <87mu6isv6z.fsf@dell.be.48ers.dk>
 <20200508163951.5hf2clb4cysufywb@einstein.dilieto.eu>
Message-ID: <87h7tsu3h7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicola" == Nicola Di Lieto <nicola.dilieto@gmail.com> writes:

 > On Fri, May 08, 2020 at 10:11:00AM +0200, Peter Korsgaard wrote:
 >> Does that also affect the 1.0.21 version we have in 2020.02.x? If so,
 >> what is the impact? Do we need to update to 1.2.3 or cherry pick a
 >> patch?
 >> 

 > Yes, all versions prior to 1.2.3 are affected. The impact for the
 > moment is only with pebble (the non-production standalone let's
 > encrypt testing server, https://github.com/letsencrypt/pebble).

 > The production let's encrypt server runs a different software
 > (boulder) which doesn't trigger this bug, however this may change and
 > I have no control over whether or when this will happen.

 > Therefore I recommend updating to a newer version. Also note that I
 > released 1.3 about one hour ago which has a few more small fixes and
 > enhancements, see https://github.com/ndilieto/uacme/blob/master/NEWS

Sorry for the slow reponse, I have now updated 2020.02.x to 1.2.4.

-- 
Bye, Peter Korsgaard
