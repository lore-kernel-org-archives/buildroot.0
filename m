From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Dec 2015 23:59:28 +0100
Subject: [Buildroot] uClibc-admins post from martin@barkynet.com
	requires approval
In-Reply-To: <20151202220028.GG23754@vapier.lan> (Mike Frysinger's message of
 "Wed, 2 Dec 2015 17:00:28 -0500")
References: <mailman.2362.1449086836.25824.uclibc-admins@busybox.net>
 <CAC1BbcQHvWVm9LxysSR=6605h1C7Kk-Dg2thMNE4CKq3_KpPNw@mail.gmail.com>
 <878u5cfs82.fsf@dell.be.48ers.dk> <20151202220028.GG23754@vapier.lan>
Message-ID: <87a8pse9tb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 > i've added a bugzilla component, but not sure that'll really help smooth
 > over this scenario.  i looked at the API available, but i'm not seeing a
 > callback to update the versions list.
 > 	https://www.bugzilla.org/docs/4.4/en/html/api/

 > there is one to get the current list:
 > 	https://www.bugzilla.org/docs/4.4/en/html/api/Bugzilla/WebService/Product.html

 > maybe the buildroot release scripts can print a reminder ?

It actually already does, it was just late and I forgot:

echo "also don't forget to add the version to bugzilla"

-- 
Venlig hilsen,
Peter Korsgaard 
