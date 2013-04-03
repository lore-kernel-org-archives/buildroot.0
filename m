From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Apr 2013 23:00:31 +0200
Subject: [Buildroot] [PATCH] dropbear: add vfork fix
In-Reply-To: <515C95A6.7090203@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 03 Apr 2013 17:48:38 -0300")
References: <1364941788-15890-1-git-send-email-gustavo@zacarias.com.ar>
 <87zjxf5ol0.fsf@dell.be.48ers.dk> <515C95A6.7090203@zacarias.com.ar>
Message-ID: <871uar5nyo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 04/03/2013 05:47 PM, Peter Korsgaard wrote:
 >> Do we need the /dev/urandom write fix as well?

 Gustavo> I don't think so, we default to 0666 for it in the device table...
 Gustavo> Regards.

Ok, great.

-- 
Bye, Peter Korsgaard
