From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Dec 2011 16:29:12 +0100
Subject: [Buildroot] [PATCH v2] Add package connman
In-Reply-To: <20111205150111.GC30001@sapphire.tkos.co.il> (Baruch Siach's
 message of "Mon, 5 Dec 2011 17:01:11 +0200")
References: <20111205130056.GB30001@sapphire.tkos.co.il>
 <1323090955-5661-1-git-send-email-zonque@gmail.com>
 <87obvnrsnv.fsf@macbook.be.48ers.dk>
 <20111205150111.GC30001@sapphire.tkos.co.il>
Message-ID: <87k46brq9j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 >> You probably also need to add wpa_supplicant to CONNMAN_DEPENDENCIES

 Baruch> AFAIK, wpa_supplicant is a run-time dependency, not a
 Baruch> build-time one. So, the Config.in 'select' should be enough.

Ok, in that case it's fine.

-- 
Bye, Peter Korsgaard
