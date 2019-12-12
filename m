From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 08:46:20 +0100
Subject: [Buildroot] [PATCH 1/3] package/dante: remove --without-pam
In-Reply-To: <20191209222746.3440986-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 9 Dec 2019 23:27:44 +0100")
References: <20191209222746.3440986-1-fontaine.fabrice@gmail.com>
Message-ID: <877e32htpv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > --without-pam was wrongly put back by commit
 > 6d8abc7c1aca00a8ee514b38d88744ccd9ec194f

I was a bit confused about that, as that commit is fine. What instead
happened was that I made a mistake when I merged next into master for
the 2019.02 cycle.

So I have updated the commit message to mention this and applied,
thanks.

-- 
Bye, Peter Korsgaard
